class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.integer :amount
      t.references :stuff, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
