class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table(:books, id: false) do |t|
      t.string :id
      t.string :title
      t.string :author
      t.string :cover_image_url
      t.string :page_count
      t.string :publisher
      t.string :synopsis

      t.timestamps
    end
  end
end
