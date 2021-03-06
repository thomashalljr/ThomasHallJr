class ArticlesController < ApplicationController
  before_action :find_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user = User.first

    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def show
    find_article
  end

  def edit
    find_article
  end

  def update
    find_article

    if @article.update(article_params)
      flash[:success] = "Article was updated"
      redirect_to article_path(@article)
    else
      render "edit"
    end
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def destroy
    find_article
    @article.destroy
    flash[:success] = "Article was deleted"
    redirect_to articles_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end

    def find_article
      @article = Article.find(params[:id])
    end
end
