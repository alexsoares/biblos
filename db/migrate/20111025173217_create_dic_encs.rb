class CreateDicEncs < ActiveRecord::Migration
  def self.up
    create_table :dic_encs do |t|
      t.string :tomboL
      t.string :tomboS
      t.string :tipo
      t.references :identificacao
      t.string :volume
      t.references :editora
      t.string :edicao
      t.datetime :data
      t.string :obs

      t.timestamps
    end
  end

  def self.down
    drop_table :dic_encs
  end
end
