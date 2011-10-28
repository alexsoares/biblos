class CreateLocalizacaos < ActiveRecord::Migration
  def self.up
    create_table :localizacaos do |t|
      t.references :unidade
      t.references :livro
      t.references :audiovisuai
      t.references :jogo
      t.references :mapa
      t.references :periodico
      t.references :dic_enc
      t.string :localguardado
      t.string :aquisicao
      t.datetime :dataaquisicao
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :localizacaos
  end
end
