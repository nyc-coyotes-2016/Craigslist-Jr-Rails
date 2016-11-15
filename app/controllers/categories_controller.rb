class CategoriesController < ApplicationController
  before_action :find_and_ensure_category, only: [:show]
  def index
    @categories = Category.order(title: :asc)
  end

  def show
    @category = Category.find_by(id: params[:id])
    @articles = @category.articles.order(created_at: :desc)

  end

  private

    def find_and_ensure_category
      render 'application/error_404' unless @category = Category.find_by(id: params[:id])
    end
end
