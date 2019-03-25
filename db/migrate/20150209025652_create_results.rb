class CreateResults < ActiveRecord::Migration[5.2]
  def change
    create_table :results do |t|
      t.references :lesson

      t.timestamps null: false
    end
  end
end
