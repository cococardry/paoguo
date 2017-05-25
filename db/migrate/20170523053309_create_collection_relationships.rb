class CreateCollectionRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :collection_relationships do |t|
      t.integer :collection_id
      t.integer :question_id

      t.timestamps
    end
  end
end
