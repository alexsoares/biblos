class Identificacao < ActiveRecord::Base
has_many :audiovisuis
has_many :livros
has_many :dic_encs
has_many :autors, :class_name => 'Autor', :foreign_key => 'identificacao_id', :dependent => :destroy
  accepts_nested_attributes_for :autors



def before_save
  self.codigo.upcase!
  self.titulo.upcase!
  self.subtitulo.upcase!
  self.obs.upcase!
end

end
