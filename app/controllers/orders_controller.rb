class OrdersController < ApplicationController

    def index
        @check = Checkout.where("user_id = ?",current_user.id)
    end
end
