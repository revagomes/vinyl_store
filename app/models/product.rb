class Product < ActiveRecord::Base

=begin
	[:name,:price].each{|col| validates_presence_of col } end # Iterando configurações semelhantes via ruby
	
	PS.: Comentários de bloco não podem ser identados
=end
	
  validates_presence_of		:name, :price,						# Valida a presença dos valores (:name, :price)				
							:message => 'Não está preenchido'	# Atribui o param mensagem a ambos
	
  validates_uniqueness_of	:name	# :message => 'já existe' >> exibiria a mensagem costomizada, porém deste modo não possibilita internacionalização
	
  validates_numericality_of	:price,
							:greater_than => 0	# Valida se o valor é um número
								
  validates_numericality_of	:stock,
							:only_integers => true,
							:graeater_than_or_equal_to => 0
								
  validates_length_of		:description,
							:within => 20..400 
							
  named_scope :front,								# Cria métdos de Classe
			  :conditions => {:front => true}
			  
  named_scope :with_stock, 
			  :conditions => 'stock > 0'
			  
  def to_param
	"#{id}-#{name.parameterize}"
  end
end
