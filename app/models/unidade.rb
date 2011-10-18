class Unidade < ActiveRecord::Base
has_and_belongs_to_many :livros
belongs_to :tipo
has_many :protocolos
has_many :users
has_many :audiovisuais

validates_presence_of :nome, :message => ' - DIGITAR NOME DA UNIDADE - '
validates_presence_of :tipo_id, :message => ' - SELECIONAR TIPO DE UNIDADE - '

protected


  def before_save
    self.nome.upcase!
    self.endereco.upcase!
    self.complemento.upcase!
    self.bairro.upcase!
    self.diretor.upcase!
    self.coordenador.upcase!
    self.obs.upcase!
  end
 


  end
