class CommentController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to article_path(comment.article)
    else
      redirect_to article_path(comment.article)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(article_id: params[:article_id])
  end
end
