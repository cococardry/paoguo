class Question < ApplicationRecord
  has_many :collection_relationships
  has_many :collections, through: :collection_relationships, source: :collection
  has_many :answers
end
