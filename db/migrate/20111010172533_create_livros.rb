class CreateLivros < ActiveRecord::Migration
  def self.up
    create_table :livros do |t|
      t.references :assuntoiten
      t.references :identificacao
      t.references :area
      t.references :editora
      t.references :localizacao
      t.string :tomboS
      t.string :tomboL
      t.string :colecao
      t.string :edicao
      t.datetime :dataedicao
      t.string :localedicao
      t.string :resumo
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :livros
  end
end
