class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.references :category, index: true
      t.references :user, index: true
      t.text :word_ids
      t.text :answer_ids

      t.timestamps null: false
    end
  end
end
