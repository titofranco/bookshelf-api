module Api
  class BooksController < ApplicationController
    
    before_action :authorize!
    before_action :can_read_books!

    def index
      books = Book.all
      render json: books, each_serializer: BookSerializer
    end
  end

end