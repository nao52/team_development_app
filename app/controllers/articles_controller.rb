class ArticlesController < ApplicationController
  def index
    @articles = Article.includes(:user).order(created_at: :desc)
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

  def show
    @article = Article.find(params[:id])
    @comment = Comment.new
    @comments = @article.comments.include(:user).order(created_at: :desc)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to articles_url
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    Article.find(params[:id]).destroy
    redirect_to articles_url, status: :see_other
  end

  private

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
