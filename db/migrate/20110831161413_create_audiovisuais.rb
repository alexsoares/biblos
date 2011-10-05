class CreateAudiovisuais < ActiveRecord::Migration
  def self.up
    create_table :audiovisuais do |t|
      t.string :tombo
      t.string :tipo
      t.string :titulo
      t.string :subtitulo
      t.string :colecao
      t.string :producao
      t.references :generomidia
      t.string :localproducao
      t.datetime :dataproducao
      t.string :aquisicao
      t.datetime :dataaquisicao
      t.string :localguardado
      t.references :unidade, :null => false
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :audiovisuais
  end
end
