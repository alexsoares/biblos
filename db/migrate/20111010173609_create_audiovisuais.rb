class CreateAudiovisuais < ActiveRecord::Migration
  def self.up
    create_table :audiovisuais do |t|
      t.references :genero
      t.references :localizacao
      t.string :tomboS
      t.string :tomboL
      t.string :titulo
      t.string :subtitulo
      t.string :producao
      t.string :produtor
      t.datetime :dataporducao
      t.string :localproducao
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :audiovisuais
  end
end
