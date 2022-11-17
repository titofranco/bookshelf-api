class Book < ApplicationRecord
  self.primary_key = :id #Book id a 10 length string
  has_many :list_items
end
