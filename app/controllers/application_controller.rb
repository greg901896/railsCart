class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :init_cart

  include CartsHelper
  
  private
  def init_cart
    @cart = Cart.from_hash(session[:cart9486])
  end
end
