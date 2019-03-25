class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :japanese
      t.references :category, index: true

      t.timestamps null: false
    end
    add_index :words, :japanese, unique: true
    add_index :words, [:japanese, :category_id], unique: true
  end
end
