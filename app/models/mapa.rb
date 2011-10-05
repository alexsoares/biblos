class Mapa < ActiveRecord::Base
 belongs_to :unidade
 belongs_to :editora

validates_presence_of :titulo, :message => ' - DIGITAR TÍTULO DO MAPA -'
validates_presence_of :tipo, :message => ' - SELECIONAR TIPO DE MAPA- '


  def before_save
    self.titulo.upcase!
    self.formato.upcase!
    self.localguardado.upcase!
    self.obs.upcase!
  end





end
