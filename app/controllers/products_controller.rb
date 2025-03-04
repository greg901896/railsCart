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
  end

  def plus_cart
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
      a1 = (1..10).to_a.each do |i|
        Productkey.create!(
          title: @product.title,
          title_code: @product.id.to_s+"#{i}",
          
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
    
    redirect_to products_path, notice: "商品已刪除"
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