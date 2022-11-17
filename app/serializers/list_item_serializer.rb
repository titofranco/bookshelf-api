class ListItemSerializer < ActiveModel::Serializer
  attributes :id, :book_id, :ownerId, :rating, :notes, :finishDate, :startDate, :created_at, :updated_at

  belongs_to :book

end
