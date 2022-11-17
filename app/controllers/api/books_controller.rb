module Api
  class BooksController < ApplicationController

    before_action :authorize!
    before_action :can_read_books!

    def index
      books = Book.order(:title).limit(10)
      books = books.where("title ILIKE ?", "%#{params[:query]}%") if params[:query]
      render json: books, each_serializer: BookSerializer
    end

    def show
      book = Book.find_by(id: params[:id])
      render json: book, serializer: BookSerializer
    end
  end

end


