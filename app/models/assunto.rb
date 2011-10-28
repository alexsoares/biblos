class Assunto < ActiveRecord::Base
belongs_to :livro

def before_save
    self.assunto.upcase!
end

end
