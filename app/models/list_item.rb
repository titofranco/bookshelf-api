class ListItem < ApplicationRecord
  belongs_to :book, primary_key: :id
end
