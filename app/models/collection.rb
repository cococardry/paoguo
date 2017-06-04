class Collection < ApplicationRecord
  has_many :collection_relationships
  has_many :questions, :through => :collection_relationships, :source => :question

  has_many :articles

  def join!(question)
    questions << question
  end
end
