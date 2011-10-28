class CreateMapas < ActiveRecord::Migration
  def self.up
    create_table :mapas do |t|
      t.string :tomboL
      t.string :tomboS
      t.string :titulo
      t.string :tipo
      t.string :formato
      t.references :editora
      t.datetime :data
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :mapas
  end
end
