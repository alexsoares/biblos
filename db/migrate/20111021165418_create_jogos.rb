class CreateJogos < ActiveRecord::Migration
  def self.up
    create_table :jogos do |t|
      t.string :tomboL
      t.string :tomboS
      t.string :nome
      t.string :fabricante
      t.string :descricao
      t.string :faixaetaria
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :jogos
  end
end
