class PostsController < ApplicationController
  expose(:post, finder: :find_by_slug, attributes: :post_params)
  expose(:posts)
  expose(:categories)
  expose(:comment) { post.comments.build }
  def show
  end

  def index
  end

  def new
  end

  def create
    if post.save
      flash[:success] = "Post has been created successfully."
      redirect_to post
    else
      flash[:error] = "Sorry! An error has occurred in creation of the post."
      render :new
    end
  end

  def edit
  end

  def update
    if post.save
      flash[:success] = "Post has been updated successfully."
      redirect_to post 
    else
      render :edit
    end
  end

  def destroy
    post.destroy
    flash[:success] = "Post has been deleted successfully."
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :published)
  end
end
