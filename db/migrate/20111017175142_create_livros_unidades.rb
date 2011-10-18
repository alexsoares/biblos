class CreateLivrosUnidades < ActiveRecord::Migration
  def self.up
    create_table :livros_unidades, :id => false do |t|
      t.references :livro, :null => false
      t.references :unidade, :null => false
    end

  end

  def self.down
    drop_table :livro_unidades
  end
end
