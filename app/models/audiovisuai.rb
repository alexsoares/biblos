class Audiovisuai < ActiveRecord::Base
  belongs_to :generomidia
  
  has_many :localizacaos, :class_name => 'Localizacao', :foreign_key => 'audiovisuai_id', :dependent => :destroy
  accepts_nested_attributes_for :localizacaos


  has_many :musicas, :class_name => 'Musica', :foreign_key => 'audiovisuai_id', :dependent => :destroy
  accepts_nested_attributes_for :musicas

  validates_presence_of :titulo, :message => ' - TÍTULO EM BRANCO - '
  validates_presence_of :generomidia_id, :message => ' - GÊNERO EM BRANCO - '

def before_save
   
    self.titulo.upcase!
    self.subtitulo.upcase!
    self.producao.upcase!
    self.localproducao.upcase!
    self.obs.upcase!
end



end
