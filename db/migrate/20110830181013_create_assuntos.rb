class CreateAssuntos < ActiveRecord::Migration
  def self.up
    create_table :assuntos do |t|
      t.string :assunto
      t.references :livro
      t.timestamps
    end
  end

  def self.down
    drop_table :assuntos
  end
end
