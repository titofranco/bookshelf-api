class CreateListItems < ActiveRecord::Migration[6.1]
  def change
    create_table :list_items do |t|
      t.string :bookId
      t.string :ownerId
      t.integer :rating, default: 0
      t.text :notes
      t.bigint :finishDate
      t.bigint :startDate
      t.timestamps
    end
  end
end
