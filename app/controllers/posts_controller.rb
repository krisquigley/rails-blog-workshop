class PostsController < ApplicationController
  expose(:post, finder: :find_by_slug)
  expose(:posts)

  def show
  end

  def index
  end

  def new
  end

  def create
    post = Post.new(post_params)
    if post.save!
      redirect_to post
    end
  end

  def edit
  end

  def destroy
  end
end
