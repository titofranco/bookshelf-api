class ListItem < ApplicationRecord
  belongs_to :book, foreign_key: 'bookId'
end
