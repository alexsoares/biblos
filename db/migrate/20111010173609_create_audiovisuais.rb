class CreateAudiovisuais < ActiveRecord::Migration
  def self.up
    create_table :audiovisuais do |t|
      t.references :generomidia
      t.string :tomboS
      t.string :tomboL
      t.string :tipo
      t.string :titulo
      t.string :subtitulo
      t.string :colecao
      t.string :producao
      t.datetime :dataproducao
      t.string :localproducao
      t.string :aquisicao
      t.datetime :dataaquisicao
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :audiovisuais
  end
end
