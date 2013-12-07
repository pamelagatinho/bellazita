class OrderProduct < ActiveRecord::Base
  belongs_to :order
  belongs_to :product, counter_cache: true

  validates_uniqueness_of :product_id, scope: :order_id
end
