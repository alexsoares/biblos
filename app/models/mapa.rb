class Mapa < ActiveRecord::Base
  belongs_to :editora
  has_many :localizacaos, :class_name => 'Localizacao', :foreign_key => 'mapa_id', :dependent => :destroy
  accepts_nested_attributes_for :localizacaos


def before_save
    self.titulo.upcase!
    self.obs.upcase!

end


end
