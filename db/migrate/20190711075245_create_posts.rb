class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.text :post_text
      t.string :post_image_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
