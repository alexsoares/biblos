class Localizacao < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :livro
  belongs_to :audiovisuai
  belongs_to :jogo
  belongs_to :mapa
  belongs_to :periodico
  belongs_to :dic_enc

def before_save
    self.localguardado.upcase!
end


end
