class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :content
      t.references :word, index: true
      t.boolean :correct

      t.timestamps null: false
    end
  end
end
