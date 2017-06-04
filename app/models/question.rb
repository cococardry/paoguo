class Question < ApplicationRecord
  has_many :collection_relationships
  has_many :collections, -> {distinct}, :through => :collection_relationships, :source => :collection
  has_many :answers

  def is_member_of?(collection)
     collections.include?(collection)
  end

  def join!(collection)
    collections << collection
  end

  def quit!(collection)
    collections.delete(collection)
  end
end
