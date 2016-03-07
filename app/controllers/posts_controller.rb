class PostsController < ApplicationController
  expose(:post, finder: :find_by_slug, attributes: :post_params)
  expose(:posts)
  expose(:comment) { post.comments.build }

  def show
  end

  def index
  end

  def new
  end

  def create
    if post.save
      flash.notice = "#{post.title} post created"
      redirect_to post 
    else
      render :new
    end
  end

  def edit
    if post.save
      flash.notice = "#{post.title} post updated"
    else 
      flash.notice = "#{post.title} Could not save. Please throw computer at wall."
    end
  end

  def update
    if post.save
      flash.notice = "#{post.title} post updated"
      redirect_to post 
    else
      flash.notice = "#{post.title} Could not save. Please throw computer at wall."
      render :edit
    end
  end

  def destroy
    post.destroy
    if post.destroy
      flash.notice = "#{post.title} post deleted"
    end
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, :published)
  end
end
