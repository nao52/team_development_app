class ArticlesController < ApplicationController
  def index
    @articles = Article.all.includes(:user).order(created_at: :desc)
  end

  def new
  end

  def edit
  end
end
