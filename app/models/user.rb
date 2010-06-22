class User < ActiveRecord::Base
 validates_presence_of		:name, :email, :cep, :address, :login, :password
 validates_uniqueness_of	:email, :login
 validates_acceptance_of	:terms,
							:accept => true,
							:allow_nil => false
  validates_confirmation_of :password
  validates_format_of		:cep, 
							:with => /^\d{5}-\d{3}$/
  validates_format_of		:email,
							:with => /^\w+@[\w.]+$/
							
  validate	:password_strenght
  def password_strenght
	errors.add(:password, 'é muito fraca') if weak_password?
  end
  def weak_password?
    password.same_char? or password.sequence?
  end
  
end
