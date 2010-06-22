class PaymentMethod < ActiveRecord::Base
  validates_presence_of :name, :months, :days, :description
  validates_uniqueness_of :name
  validates_inclusion_of :months, :in => 1..12
  validates_numericality_of :days, :only_integers => true, :greater_than_or_equal_to => 0
  
  named_scope :active, :conditions => {:active => true}
  
end
