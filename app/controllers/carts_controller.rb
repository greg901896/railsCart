class CartsController < ApplicationController
    before_action :find_product , only: [:add]
    
    def add #刪除購物車
     @product.stock += @product.count_cart
     @product.count_cart = 0
     @product.save
     redirect_to cart_path 
    end
    
    def checkout
      @check = Product.where("user_id = ?", current_user.id)
      @total_price = Product.where("user_id = ?", current_user.id).sum("count_cart * price")
      @final_price 
      @delivery = 0
    end
    
    def submit
      @final_price = session[:total]
      @user_id = current_user.id 
      cr = Checkout.create!(user_id: current_user.id , total_price: @final_price)
      cr.save
      @cr_id = cr.id 
      @check = Product.where("user_id = ?", current_user.id).where("count_cart > 0 ")
      @check.each do |product|
        if product.type == "DigitalProduct"
          @word = "DigitalProduct"
        else
          @word = "RealProduct"
        end
        OrderItem.create!(
          title: product.title,
          price: product.price,
          count_cart: product.count_cart,
          user_id: @user_id,
          order_id: @cr_id,
          product_type: @word,
          stock: product.stock.presence - product.count_cart || nil, # 預設 stock 為 0
          url: product.url.presence || nil  # 預設 url 為 "N/A"
        )
        if product.type == "DigitalProduct"
          (1..product.count_cart).to_a.each do |i|
            @set_key = Productkey.where(title: product.title).find_by(user_id: nil)
            @set_key.update(user_id: current_user.id , order_id: @cr_id)
          end 
        end 
      end 
      @check = Product.where("user_id = ?", current_user.id).where("count_cart > 0 ")
      @check.each do |product|
        product.update(count_cart: 0)
      end 
      redirect_to products_path 
    end

    def destroy
      end
    
    def show
      @check = Product.where("user_id = ?", current_user.id)
      @total_price = Product.where("user_id = ?", current_user.id).sum("count_cart * price")
    end

    private
    def find_product
      puts "Params ID: #{params[:id]}"
      @product = Product.find_by(id: params[:id])
      redirect_to products_path, notice: "無此商品" unless @product
    end
end
