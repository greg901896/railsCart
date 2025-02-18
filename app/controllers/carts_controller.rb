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
      @check = Product.where("user_id = ?", current_user.id)
      @total_price = Product.where("user_id = ?", current_user.id).sum("count_cart * price")

    end

end
