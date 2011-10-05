class Assunto < ActiveRecord::Base

  


  validates_presence_of :nome, :message => ' - ASSUNTO EM BRANCO - '

  def before_save
    self.nome.upcase!
end
end
