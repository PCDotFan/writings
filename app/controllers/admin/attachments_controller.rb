class Admin::AttachmentsController < Admin::BaseController
  def index
    @attachments = Attachment.order("created_at DESC").page(params[:page]).per(25)
  end
end
