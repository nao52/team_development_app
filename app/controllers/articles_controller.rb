class ArticlesController < ApplicationController
  def index
    @articles = Article.all.includes(:user).order(created_at: :desc)
  end

  def new
    @article = Article.new
  end

  def create
    user = User.first
    @article = user.articles.build(article_params)
    if @article.save
      redirect_to articles_url
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
