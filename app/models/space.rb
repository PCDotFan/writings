class Space < ActiveRecord::Base
  include ActiveModel::ForbiddenAttributesProtection
  include Gravtastic

  gravtastic :gravatar_email, :filetype => :png, :size => 100

  has_many :articles, :dependent => :delete_all
  has_many :attachments, :dependent => :destroy
  has_many :export_tasks, :dependent => :destroy
  has_many :import_tasks, :dependent => :destroy
  has_many :invitations, :dependent => :delete_all
  has_many :orders, :dependent => :delete_all

  has_many :users_spaces, dependent: :destroy
  has_many :members, through: :users_spaces, source: :user

  PLANS = %w(free base)

  validates :name, :presence => true, :uniqueness => {:case_sensitive => false}, :format => {:with => /\A[a-z0-9-]+\z/, :message => I18n.t('errors.messages.space_name') }, :length => {:in => 4..20}
  validates :domain, :format => {:with => /\A[a-zA-Z0-9_\-.]+\z/}, :uniqueness => {:case_sensitive => false}, :allow_blank => true

  validate :except_host

  scope :in_plan, -> plan {
    if plan.to_s == 'free'
      scoped.or({:plan => plan}, {:plan_expired_at.lt => Time.now})
    else
      where(:plan => plan, :plan_expired_at.gt => Time.now)
    end
  }

  def except_host
    if domain =~ /#{Regexp.escape APP_CONFIG["host"]}/
      errors.add(:domain, I18n.t('errors.messages.invalid'))
    end
  end

  def host
    (domain_enabled? && domain.present?) ? domain : "#{name}.#{APP_CONFIG['host']}"
  end

  def to_param
    name.to_s
  end

  def display_name
    full_name.present? ? full_name : name
  end

  def creator
    @creator ||= self.users_spaces.creators.map(&:user).first
  end

  def add_user(user, role)
    self.users_spaces.create(user_id: user.id, role: role)
  end

  def add_creator(user)
    self.add_user(user, UsersSpace::CREATOR)
  end

  def add_collaborator(user)
    self.add_user(user, UsersSpace::COLLABORATOR)
  end

  def in_plan?(plan)
    if plan == :free
      self.plan == plan || plan_expired_at.blank? || plan_expired_at < Time.now
    else
      self.plan == plan && plan_expired_at.present? && plan_expired_at > Time.now
    end
  end

  def storage_limit
    if plan_expired_at.present? && plan_expired_at > Time.now
      case plan
      when :base
        1.gigabytes
      else
        10.megabytes
      end
    else
      10.megabytes
    end
  end

  def version_limit
    if plan_expired_at.present? && plan_expired_at > Time.now
      case plan
      when :base
        50
      else
        5
      end
    else
      5
    end
  end

  def domain_enabled?
    !in_plan?(:free)
  end
end
