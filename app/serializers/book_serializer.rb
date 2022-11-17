class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :coverImageUrl, :id, :pageCount, :publisher, :synopsis
end
