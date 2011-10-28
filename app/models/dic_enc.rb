class DicEnc < ActiveRecord::Base
  belongs_to :identificacao
  belongs_to :editora
  has_many :localizacaos, :class_name => 'Localizacao', :foreign_key => 'dic_enc_id', :dependent => :destroy
    accepts_nested_attributes_for :localizacaos

def before_save
  self.volume.upcase!
  self.obs.upcase!
end


end
