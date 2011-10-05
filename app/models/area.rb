class Area < ActiveRecord::Base
 has_many :livros

    validates_presence_of :nome, :message => ' - ASSUNTO EM BRANCO - '

  def before_save
    self.nome.upcase!
end

end
