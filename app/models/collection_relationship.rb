class CollectionRelationship < ApplicationRecord
  belongs_to :collection
  belongs_to :question
end
