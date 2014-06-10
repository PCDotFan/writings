class AlipayNotify < ActiveRecord::Base
  serialize :params, Hash

  belongs_to :order
end
