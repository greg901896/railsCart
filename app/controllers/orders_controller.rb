class OrdersController < ApplicationController
    before_action :find_order ,:index
    include Pagy::Backend

    def index
        @check = Checkout.where("user_id = ?",current_user.id)
        @new_check = OrderItem.where(order_id: params[:id])
    end
    
    def edit
    end

    def code
        # @key = Productkey.where("user_id = ?",current_user.id)
        @pagy, @key = pagy(Productkey.where("user_id = ?",current_user.id), items: 2)
    end

    def find_order
        @check = Product.where("user_id = ?", current_user.id)
        @total_price = OrderItem.where("user_id = ?", current_user.id).where(order_id: params[:id]).sum("count_cart * price")
    end
end
