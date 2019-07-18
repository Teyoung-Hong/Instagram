class DestroyTagLoveTable < ActiveRecord::Migration[5.2]
  def change
    drop_table :tag_loves
  end
end
