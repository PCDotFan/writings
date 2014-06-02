class Admin::AlipayNotifiesController < Admin::BaseController
  def index
    @alipay_notifies = AlipayNotify.order("created_at DESC").page(params[:page])
  end

  def show
    @alipay_notify = AlipayNotify.find params[:id]
  end
end
