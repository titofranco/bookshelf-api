class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :cover_image_url, :id, :page_count, :publisher, :synopsis
end
