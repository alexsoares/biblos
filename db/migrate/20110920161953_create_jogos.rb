class CreateJogos < ActiveRecord::Migration
  def self.up
    create_table :jogos do |t|
      t.string :tombo
      t.string :nome
      t.string :faixaetaria
      t.string :fabricante
      t.string :descricao
      t.string :aquisicao
      t.datetime :dataaquisicao
      t.string :localguardado
      t.references :unidade
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :jogos
  end
end
