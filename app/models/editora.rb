class Editora < ActiveRecord::Base
  has_many :isbns
  has_many :mapas

    validates_presence_of :nome, :message => ' - EDITORA EM BRANCO - '

  def before_save
    self.nome.upcase!
    self.cidade.upcase!
    self.pais.upcase!
end

end
