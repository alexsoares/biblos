class Periodico < ActiveRecord::Base
     belongs_to :unidade

def before_save
    self.titulo.upcase!
    self.colecao.upcase!
    self.producao.upcase!
    self.localproducao.upcase!
    self.localguardado.upcase!
    self.obs.upcase!
  end
end
