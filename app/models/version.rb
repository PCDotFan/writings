class Version < ActiveRecord::Base
  belongs_to :article
  belongs_to :space
end
