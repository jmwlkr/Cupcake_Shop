class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.shop_id = params[:shop_id]

    if @product.save
      flash[:notice] = "Product was Created"
      redirect_to "/shops/#{ @product.shop_id }"
    else
      flash[:alert] = @product.errors.full_messages
      redirect_to "/shops/#{ params[:shop_id] }/products/new"
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      flash[:notice] = "Product Updated"
      redirect_to "/shops/#{ params[:shop_id] }/products/#{ params[:id] }"
    else
      flash[:alert] = @product.errors.full_messages
      redirect_to "/shops/#{ params[:shop_id] }/products/new"
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:price, :name, :desc)
  end

end