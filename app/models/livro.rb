class Livro < ActiveRecord::Base
  belongs_to :isbn
  belongs_to :area
  belongs_to :unidade
end
