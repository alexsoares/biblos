class CreateLivros < ActiveRecord::Migration
  def self.up
    create_table :livros do |t|
      t.string :tombo
      t.references :isbn
      t.datetime :dataedicao
      t.references :area
      t.string :assunto1
      t.string :assunto2
      t.string :assunto3
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
