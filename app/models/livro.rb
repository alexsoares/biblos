class Livro < ActiveRecord::Base
  has_and_belongs_to_many :unidades
  belongs_to :identificacao
  belongs_to :area
  belongs_to :editora
  has_many :localizacaos, :class_name => 'Localizacao', :foreign_key => 'livro_id', :dependent => :destroy
  accepts_nested_attributes_for :localizacaos
  has_many :assuntos, :class_name => 'Assunto', :foreign_key => 'livro_id', :dependent => :destroy
  accepts_nested_attributes_for :assuntos

  validates_presence_of :identificacao_id, :message => ' - IDENTIFICADOR EM BRANCO - '
  validates_presence_of :area_id, :message => ' - ÁREA EM BRANCO - '
  validates_presence_of :editora_id, :message => ' - EDITORA EM BRANCO - '
  



end

