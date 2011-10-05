class CreatePeriodicos < ActiveRecord::Migration
  def self.up
    create_table :periodicos do |t|
      t.string :tombo
      t.string :titulo
      t.string :tipo
      t.string :colecao
      t.string :producao
      t.string :periodicidade
      t.integer :issn
      t.string :localproducao
      t.datetime :dataproducao
      t.string :aquisicao
      t.datetime :dataaquisicao
      t.string :localguardado
      t.references :unidade
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :periodicos
  end
end
