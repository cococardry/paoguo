class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.text :content
      t.integer :collection_id
      t.boolean :is_included
      t.timestamps
    end
  end
end
