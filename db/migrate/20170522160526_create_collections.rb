class CreateCollections < ActiveRecord::Migration[5.0]
  def change
    create_table :collections do |t|
      t.string :title
      t.float :price
      t.integer :question_id
      t.text :content
      t.timestamps
    end
  end
end
