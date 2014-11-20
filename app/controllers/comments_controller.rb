class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = session[:user_id]
    @comment.product_id = params[:product_id]
    if @comment.save
      flash[:notice] = "Comment was created"
      redirect_to "/shops/#{ params[:shop_id] }/products/#{ params[:product_id]}"
    else
      flash[:alert] = @comment.errors.full_messages
      redirect_to "/shops/#{ params[:shop_id] }/products/#{ params[:product_id]}"
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to "/shops/#{ params[:shop_id] }/products/#{ params[:id]}"
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

end
