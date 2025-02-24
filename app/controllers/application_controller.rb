class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
  before_action :init_cart
  include CartsHelper
 


  private
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end
  private
  def init_cart
    @cart = Cart.from_hash(session[:cart948])
  end
end
