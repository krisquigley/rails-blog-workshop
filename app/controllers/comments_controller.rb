class CommentsController < ApplicationController
  expose(:post) { Post.friendly.find(params[:post_id] || comment_params[:post_id]) }
  expose(:comment, attributes: :comment_params)

  def new
  end

  def create
    post.comments.build(comment_params)
    if post.save
      redirect_to post
    else
      render :new
    end
  end

  def edit
  end

  def update
    if comment.save
      redirect_to post
    else
      render :edit
    end
  end

  def destroy
    comment.destroy

    redirect_to post
  end

  private

  def comment_params
    params.require(:comment).permit(:name, :body, :post_id)
  end
end