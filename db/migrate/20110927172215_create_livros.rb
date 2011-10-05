class CreateLivros < ActiveRecord::Migration
  def self.up
    create_table :livros do |t|
      t.string :tombo
      t.references :isbn
      t.datetime :dataedicao
      t.references :area
      t.string :as
      t.string :ass
      t.string :assu
      t.string :resumo
      t.string :aquisicao
      t.datetime :dataaquisicao
      t.string :localguardado
      t.references :unidade
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :livros
  end
end
