class Admin::ArticlesController < Admin::BaseController
  def index
    @articles_scope = Article.where(nil)
    if params[:name]
      @space = Space.where(:name => params[:name]).first
      @articles_scope = @articles_scope.where(:space_id => (@space ? @space.id : nil))
    end

    @articles = case params[:tab]
                when 'all'
                  @articles_scope.order("updated_at DESC").includes(:space).page(params[:page]).per(25)
                else
                  @articles_scope.publish.order("published_at DESC").includes(:space).page(params[:page]).per(25)
                end
  end

  def show
    @article = Article.find params[:id]
  end
end
