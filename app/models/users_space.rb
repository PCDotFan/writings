class UsersSpace < ActiveRecord::Base
  include Enum::Role

  belongs_to :user
  belongs_to :space

  scope :creators, -> { where(role: CREATOR) }
  scope :collaborators, -> { where(role: COLLABORATOR) }

  validates :user_id, presence: true
  validates :space_id, presence: true
  validates :user_id, uniqueness: { scope: [:space_id], message: "already exists in space" }
end
