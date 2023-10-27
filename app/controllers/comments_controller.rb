class CommentsController < ApplicationController
  def create
    comment = current_user.comments.build(comment_params)
    if comment.save
      redirect_to article_path(comment.article), success: t('.success')
    else
      redirect_to article_path(comment.article), danger: t('.danger')
    end
  end

  def edit
    comment = current_user.comments.find(params[:id])
  end

  def update
    comment = current_user.comments.find(params[:id])
    if comment.update(comment.params)
      redirect_to article_path(comment.article), success: t('.success')
    else
      flash.now[:danger] = t('.failure')
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    comment = current_user.comments.find(params[:id])
    comment.destroy!
    redirect_to article_path, status: :see_other, success: t('.success')
  end

  private

  def comment_params
    params.require(:comment).permit(:body).merge(article_id: params[:article_id])
  end
end
