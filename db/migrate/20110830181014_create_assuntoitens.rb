class CreateAssuntoitens < ActiveRecord::Migration
  def self.up
    create_table :assuntoitens do |t|
      t.references :assunto

      t.timestamps
    end
  end

  def self.down
    drop_table :assuntoitens
  end
end
