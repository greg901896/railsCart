module CartsHelper
    def current_cart
        @cart ||= Cart.from_hash(session[:cart948])
      end
end
