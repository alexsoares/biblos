class Isbn < ActiveRecord::Base
  belongs_to :editora
  has_many :livros

  def before_save
    self.titulo.upcase!
    self.subtitulo.upcase!
    self.colecao.upcase!
    self.autor.upcase!
     self.localedicao.upcase!
    self.obs.upcase!

  end


end
