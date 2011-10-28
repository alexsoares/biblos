class CreatePeriodicos < ActiveRecord::Migration
  def self.up
    create_table :periodicos do |t|
      t.string :tomboL
      t.string :tomboS
      t.string :tipo
      t.string :titulo
      t.string :periodicidade
      t.string :issn
      t.integer :num
      t.references :editora
      t.datetime :data
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :periodicos
  end
end
