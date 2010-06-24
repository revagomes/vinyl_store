class Address < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :street, :number, :state, :city, :zip
  validates_format_of :zip, :with => /\d{5}-\d{3}/
  
  def complete
    # "#{street}, #{number} - #{city}/#{state} - #{zip}"    Refatorado
    "%s, %s - %s/%s - %s" % [street,number,city,state,zip]
  end
end
