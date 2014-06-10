class Invitation < ActiveRecord::Base
  include Gravtastic

  gravtastic :filetype => :png, :size => 100

  belongs_to :space

  validates :email, :presence => true, :uniqueness => {:case_sensitive => false, :scope => :space_id }, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/}

  before_create :set_token

  def set_token
    self.token = SecureRandom.hex(16)
  end

  after_create :send_mail

  def send_mail
    InvitationMailer.delay.invite(id.to_s)
  end
end
