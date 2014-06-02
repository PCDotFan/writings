class Admin::SpacesController < Admin::BaseController
  def index
    if params[:tab]
      @spaces = Space.order("created_at DESC").in_plan(params[:tab]).page(params[:page]).per(25)
    else
      @spaces = Space.order("created_at DESC").page(params[:page]).per(25)
    end
  end

  def show
    @space = Space.find_by :name => params[:id]
  end
end
