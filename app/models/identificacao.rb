class Identificacao < ActiveRecord::Base
has_many :livros


def before_save
  self.codigo.upcase!
  self.titulo.upcase!
  self.subtitulo.upcase!
  self.autor.upcase!
  self.obs.upcase!
end

end
