class OrdersController < ApplicationController
    before_action :find_order ,:index
    def index
        @check = Checkout.where("user_id = ?",current_user.id)
        @new_check = OrderItem.where(order_id: params[:id])
    end
    
    def edit
        @new_check = OrderItem.where(order_id: params[:id])
    end

    def find_order
        @order = OrderItem.find_by(id: params[:id])
        @check = Product.where("user_id = ?", current_user.id)
        @total_price = OrderItem.where("user_id = ?", current_user.id).where(order_id: params[:id]).sum("count_cart * price")

    end


end
