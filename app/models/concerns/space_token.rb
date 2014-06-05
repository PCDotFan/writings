module SpaceToken
  extend ActiveSupport::Concern

  included do
    belongs_to :space
    before_create :set_token

    validates_uniqueness_of :token, :scope => :space_id
    validates_presence_of :space
  end

  def set_token
    key = "#{self.class.table_name}_next_id"
    #space.increment!(key)
    Space.increment_counter(key, space.id)
    self.token ||= space[key].to_s
  end

  def to_param
    token.to_s
  end
end
