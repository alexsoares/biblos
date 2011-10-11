class CreateLocalizacaos < ActiveRecord::Migration
  def self.up
    create_table :localizacaos do |t|
      t.references :unidade
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
