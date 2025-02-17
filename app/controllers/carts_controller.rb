class CartsController < ApplicationController
    def add
      @product = Product.find_by(id: params[:id])
      @product.increment(:count_cart)
      @product.save
        #current_cart.add_item(params[:id])
        #session[:cart948] = current_cart.serialize
    
        redirect_to products_path, notice: "已加入購物車"
      end

    

    def destroy
        session[:cart948] = nil
        redirect_to products_path, notice: "購物車已清空"
      end
    
    def show
      @check = Product.where("count_cart > ?", 0)
      @total_price = Product.where("count_cart > ?", 0).sum("count_cart * price")

    end

end
