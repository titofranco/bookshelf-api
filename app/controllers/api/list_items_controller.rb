module Api
  class ListItemsController < ApplicationController

    before_action :authorize!

    def index
      list_items = ListItem.includes(:book)
      render json: list_items, each_serializer: ListItemSerializer
    end

    def create
      list_item = ListItem.find_or_initialize_by(book_id: params[:bookId], startDate: params[:startDate])
      if list_item.valid?
        list_item.save
        render json: list_item.to_json(include: [:book]), status: 200
      else
        render json: {error: "Error saving list item"}, status: 400
      end
    end

    def update
      list_item = ListItem.find_by(id: params[:id])
      if list_item
        list_item.update(list_item_params)
        render json: list_item.to_json(include: [:book]), status: 200
      else
        render json: {error: "Error updating list item"}, status: 400
      end
    end

    def destroy
      list_item = ListItem.find_by(id: params[:id])
      if list_item
        list_item.destroy
        render json: {success: true}, status: :ok
      end
    end

    private

    def list_item_params
      params[:list_item].delete(:id)
      params.require(:list_item).permit(:book_id, :ownerId, :rating, :notes, :finishDate, :startDate)
    end
  end
end
