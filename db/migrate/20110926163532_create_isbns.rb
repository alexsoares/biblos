class CreateIsbns < ActiveRecord::Migration
  def self.up
    create_table :isbns do |t|
      t.string :nisbn
      t.string :titulo
      t.string :subtitulo
      t.string :colecao
      t.string :edicao
      t.references :editora
      t.string :localedicao
      t.string :autor
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :isbns
  end
end
