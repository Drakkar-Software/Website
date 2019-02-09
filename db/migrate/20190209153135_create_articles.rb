class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :author
      t.string :link
      t.string :link_text
      t.string :image_url
      t.datetime :published_at

      t.timestamps
    end
  end
end
