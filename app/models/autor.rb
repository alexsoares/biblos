class Autor < ActiveRecord::Base
belongs_to :identificacao

def before_save
    self.nome.upcase!
end


end
