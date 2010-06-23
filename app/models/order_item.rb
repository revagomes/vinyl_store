class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product
  
  validates_presence_of :order_id, :product_id, :total #, :quantity
  validates_uniqueness_of :product_id,:scope => :order_id
#  def before_validation_on_create
#    self.quantity = 1
#  end
  def before_save
    self.quantity ||= 1
    self.total = quantity * product.price
  end
  def after_save
    order.update_attribute :total, order.order_items.sum(:total)
  end
  
end
