class Livro < ActiveRecord::Base
  belongs_to :identificacao
  belongs_to :area
  belongs_to :editora
  has_many :localizacaos, :dependent => :destroy
  accepts_nested_attributes_for :localizacaos, :reject_if => lambda {|a| a[:localguardao].blank?}, :allow_destroy => true

end
