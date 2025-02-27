class CartsController < ApplicationController
    def add
      @product = Product.find_by(id: params[:id])
      @product.increment(:count_cart)
      @product.save
        #current_cart.add_item(params[:id])
        #session[:cart948] = current_cart.serialize
    
        redirect_to products_path, notice: "已加入購物車"
      end
      
    def checkout
      @check = Product.where("user_id = ?", current_user.id)
      @total_price = Product.where("user_id = ?", current_user.id).sum("count_cart * price")
      @final_price 
    end
    
    def submit
      @final_price = session[:total]
      @user_id = current_user.id 
      cr = Checkout.create!(user_id: current_user.id , total_price: @final_price)
      cr.save
      @cr_id = cr.id 

      @check = Product.where("user_id = ?", current_user.id).where("count_cart > 0 ")
      @check.each do |product|
        OrderItem.create!(
          title: product.title,
          price: @final_price,
          count_cart: product.count_cart,
          user_id: @user_id,
          order_id: @cr_id
        )
      end 
      redirect_to checkout_cart_path 
    end

    def destroy
        session[:cart948] = nil
        redirect_to products_path, notice: "購物車已清空"
      end
    
    def show
      @check = Product.where("user_id = ?", current_user.id)
      @total_price = Product.where("user_id = ?", current_user.id).sum("count_cart * price")

    end

end
