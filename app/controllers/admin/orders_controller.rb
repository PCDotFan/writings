class Admin::OrdersController < Admin::BaseController
  def index
    @orders = Order.order("created_at DESC").page(params[:page])
  end

  def show
    @order = Order.find params[:id]
  end
end
