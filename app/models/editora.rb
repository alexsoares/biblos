class Editora < ActiveRecord::Base
  has_many :mapas
  has_many :periodicos
  has_many :dic_encs
    validates_presence_of :nome, :message => ' - EDITORA EM BRANCO - '

  def before_save
    self.nome.upcase!
    self.cidade.upcase!
    self.pais.upcase!
end

end
