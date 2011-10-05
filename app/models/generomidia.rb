class Generomidia < ActiveRecord::Base
has_many :audiovisuais


validates_presence_of :nome, :message => ' - GÊNERO EM BRANCO - '


def before_save
    self.nome.upcase!
      end


end
