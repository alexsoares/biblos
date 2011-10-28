class Musica < ActiveRecord::Base
  belongs_to :audovisuai

  def before_save
    self.nome.upcase!
    self.interprete.upcase!
end

end
