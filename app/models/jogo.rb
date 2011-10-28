class Jogo < ActiveRecord::Base

has_many :localizacaos, :class_name => 'Localizacao', :foreign_key => 'jogo_id', :dependent => :destroy
  accepts_nested_attributes_for :localizacaos


def before_save
   
   self.nome.upcase!
   self.descricao.upcase!
   self.fabricante.upcase!
   self.faixaetaria.upcase!
   self.obs.upcase!
end


end
