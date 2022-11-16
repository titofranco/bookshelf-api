class CreateListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :list_items do |t|
      t.belongs_to :book
      t.bigint :ownerId
      t.integer :rating
      t.text :notes
      t.bigint :finishDate
      t.bigint :startDate

      t.timestamps
    end
  end
end
