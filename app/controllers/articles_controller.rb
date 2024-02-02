class ArticlesController < ApplicationController
  authorize_resource

  before_action :set_article, only: [:show, :edit,:update,:destroy]
  before_action :authenticate_user!, only: :show

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    article = current_user.articles.new(article_params)
    if article.save
      redirect_to articles_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

    def article_params
      params.require(:article).permit(:title, :body, :user_id)
    end

    def set_article
      @article = Article.friendly.find(params[:id])
    end
end
