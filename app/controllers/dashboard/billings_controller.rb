class Dashboard::BillingsController < Dashboard::BaseController
  before_filter :require_creator

  def show
    @orders = @space.orders.showable.order("created_at DESC").limit(5)
  end
end
