class Localizacao < ActiveRecord::Base
  belongs_to :unidade
  belongs_to :livro

end
