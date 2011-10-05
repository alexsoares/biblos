class Jogo < ActiveRecord::Base
  belongs_to :unidade

    def before_save
    self.nome.upcase!
    self.descricao.upcase!
    self.fabricante.upcase!
    self.localguardado.upcase!
    self.obs.upcase!
  end


end
