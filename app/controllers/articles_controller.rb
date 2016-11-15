class ArticlesController < ApplicationController
  include ArticlesHelper
  before_action :find_and_ensure_article, except: [:new, :create]
  before_action :creator_only, only: [:edit, :update, :destroy]
  before_action :find_and_ensure_category, only: [:new, :create, :destroy]

  def show
  end

  def new
  end

  def create
    article = @category.articles.new(article_params)
    if article.save
      flash[:success] = "Listing successfully created!"
      session[:reference_url] = article.reference_url
      binding.pry
      redirect_to category_path(@category)
    else
      @errors = article.errors.full_messages
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update_attributes(article_params)
      binding.pry
      flash[:success] = "Listing successfully updated"
      redirect_to category_article_path(@article.category, @article)
    else
      @errors = @article.errors.full_messages
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = 'Listing successfully deleted'
      redirect_to category_path(@category)
    else
      flash[:danger] = "Delete unsuccessful"
      redirect_to category_article_path(@category, @article)
    end
  end

  private

    def article_params
      params.require(:article).permit(:title, :price, :location, :description, :email, :category)
    end

    def find_and_ensure_article
      render 'application/error_404' unless @article = Article.find_by(id: params[:id])
    end

    def find_and_ensure_category
      render 'application/error_404' unless @category = Category.find_by(id: params[:category_id])
    end
end
