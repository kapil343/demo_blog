class CommentsController < ApplicationController
  before_action :set_article
  before_action :set_comment, only: :destroy

  def create
    comment = @article.comments.build(comment_params)
    comment.user = current_user
    if comment.save
      redirect_to article_path(@article)
    else
      render 'articles/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to article_path(@article)
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_article
      @article = Article.friendly.find(params[:article_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
