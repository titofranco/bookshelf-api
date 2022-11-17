class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table(:books, id: false) do |t|
      t.string :id
      t.string :title
      t.string :author
      t.string :coverImageUrl
      t.string :pageCount
      t.string :publisher
      t.string :synopsis

      t.timestamps
    end
  end
end
