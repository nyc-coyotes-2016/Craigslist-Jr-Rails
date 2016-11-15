module ArticlesHelper
  def creator?
    session[:reference_url] == @article.reference_url
  end

  def creator_only
    redirect_to categories_path unless creator?
  end
end
