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
      redirect_to post 
    else
      render :new
    end
  end

  def edit
  end

  def update
    if post.save
      redirect_to post 
    else
      render :edit
    end
  end

  def destroy
    post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :published)
  end
end
