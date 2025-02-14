module CartsHelper
    def current_cart
        @cart ||= Cart.from_hash(session[:cart9486])
      end
end
