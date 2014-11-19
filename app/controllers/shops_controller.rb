class ShopsController < ApplicationController
  def index
    @shops = Shop.all
  end

  def show
    @shop = Shop.find(params[:id])
  end

  def new
    @shop = Shop.new
  end

  def create
    @shop = Shop.new(shop_params)
    @shop.user_id = session[:user_id]

    if @shop.save
      flash[:notice] = "Shop Created!!"
      redirect_to "/shops/#{ @shop.id }"
    else
      flash[:alert] = @shop.errors.full_messages
      redirect_to "/shops/new"
    end
  end

  def edit
    @shop = Shop.find(params[:id])
  end

  def update
    @shop = Shop.find(params[:id])

    if @shop.update(shop_params)
      flash[:notice] = "Shop Updated!!"
      redirect_to "/shops/#{ @shop.id }"
    else
      flash[:alert] = @shop.errors.full_messages
      redirect_to "/shops/#{ @shop.id }/edit"
    end
  end

  def destroy
    @shop = Shop.find(params[:id])
    @shop.destroy
  end

  private

  def shop_params
    params.require(:shop).permit(:name,:address,:city,:state,:zip)
  end

end
