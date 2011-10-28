class CreateIdentificacaos < ActiveRecord::Migration
  def self.up
    create_table :identificacaos do |t|
      t.references :autor
      t.string :codigo
      t.string :titulo
      t.string :subtitulo
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :identificacaos
  end
end
