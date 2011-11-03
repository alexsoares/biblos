class Area < ActiveRecord::Base
 has_many :livros
 named_scope :teste, lambda {|*args| {:conditions => ["id = ?", (args.first)]}}

    validates_presence_of :nome, :message => ' - ASSUNTO EM BRANCO - '

  def before_save
    self.nome.upcase!
end

end
