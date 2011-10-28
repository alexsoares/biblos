class Periodico < ActiveRecord::Base
  belongs_to :editora
  has_many :localizacaos, :class_name => 'Localizacao', :foreign_key => 'periodico_id', :dependent => :destroy
  accepts_nested_attributes_for :localizacaos


  def before_save
    self.titulo.upcase!
    self.issn.upcase!
    self.obs.upcase!

end

end
