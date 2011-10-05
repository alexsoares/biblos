class Audiovisuai < ActiveRecord::Base
  belongs_to :generomidia
  belongs_to :unidade

  validates_presence_of :tipo, :message => ' - TIPO DE MIDIA EM BRANCO - '
  validates_presence_of :generomidia, :message => ' - GÊNERO EM BRANCO - '
  validates_presence_of :unidade, :message => ' - UNIDADE EM BRANCO - '
  validates_presence_of :titulo, :message => ' - TÍTULO EM BRANCO - '

  def before_save
    self.titulo.upcase!
    self.subtitulo.upcase!
    self.colecao.upcase!
    self.producao.upcase!
    self.localproducao.upcase!
    self.localguardado.upcase!
    self.obs.upcase!
  end
end
