class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.references :user
      t.integer :target_id
      t.string  :action_type 

      t.timestamps null: false
    end
  end
end
