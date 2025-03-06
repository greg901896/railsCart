require 'rest-client'
require 'nokogiri'

class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:edit, :update, :destroy, :plus_cart]
  # before_action :newstock , only: [:test,:index]
  #before_action :plus_cart , only:[:test]
  def test 
    @product = Product.find_by(id: params[:id])
    if @product.stock > 0
      @product.increment(:count_cart)
      @product.decrement(:stock)
      @product.save
      redirect_to products_path, notice: "已加入!"
    else 
      redirect_to products_path ,notice: "#{@product.title}庫存不夠"
    end
    
  end
  
  def newstock
    @total_stock = Product.where(user_id: current_user.id).where("stock > 0")
  end

  def index
    @products = Product.where(user_id: current_user.id)
    @uuu = SecureRandom.uuid
  end
  
  # binding.pry 
  def plus_cart
    # binding.pry 
    @product.user_id = current_user.id 
    @check = Product.where("user_id = ?", current_user.id)
    #@product.increment(:count_cart)
    #@product.save
    redirect_to products_path, notice: "已加入!"
  end 

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    if @product.type == "RealProduct"
      @product.stock = 30
    elsif @product.type == "DigitalProduct"
      @product.stock = 20
      @product.url = @product.description
    end

    if @product.save
      redirect_to products_path, notice: "新增商品完成"
    else
      render :new
    end
    
    if @product.type == "DigitalProduct"
      a1 = (1..20).to_a.each do |i|
        Productkey.create!(
          title: @product.title,
          # title_code: @product.id.to_s+"#{i}",
          title_code: SecureRandom.uuid,
          product_id: @product.id
          )
      end
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to products_path, notice: "商品更新成功"
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    # total = Productkey.where(title: @product.title).destroy_all
    redirect_to products_path, notice: "商品已刪除"
  end

  def total_news
    # 使用 RestClient 抓取新聞網頁
    response = RestClient.get('https://udn.com/news/breaknews/1')
    doc = Nokogiri::HTML(response.body)

    # 假設新聞標題在 h2 標籤中
    #@news_titles = doc.css('h1, h2, h3, h4, h5, h6').map(&:text)
    @news_titles = doc.css('div.story-list__text h2 a').map(&:text)

    # 渲染 total_news 頁面
    render 'total_news'
  end

  private
  def find_product
    @product = Product.find_by(id: params[:id])
    redirect_to products_path, notice: "無此商品" unless @product
  end

  def product_params
    params.require(:product).permit(:title, :description, :price,:user_id ,:type)
  end
end 