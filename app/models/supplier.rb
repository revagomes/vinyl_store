class Supplier < ActiveRecord::Base
 # Supplierid: integer, name: string, person: string, address: string, phone: string, cpf: string, cnpj: string, created_at: datetime, updated_at: datetime
 
  validates_presence_of :name,:person, :accress
  validates_uniqueness_of :name
  validates_inclusion_of :person, :in => ['física','jurídica']
  validates :valid_document
  def valid_document
    if person == 'física'
	  erros.add(:cpf, 'é obrigatório para PFs') if cpf.nil? or cpf.empty?
	elsif
	  errors.add(:cnpj, 'é obrigatório para PJs') if cnpj.nil? or cnpj.empty?
	end
  end
end
