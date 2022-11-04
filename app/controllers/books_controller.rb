class BooksController < ApplicationController
  def index
    books = Book.all
    render json: books, each_serializer: BookSerializer
  end
end
