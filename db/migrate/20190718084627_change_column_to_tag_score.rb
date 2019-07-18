class ChangeColumnToTagScore < ActiveRecord::Migration[5.2]
  def change
    rename_column :tag_scores, :tag_score, :score
  end
end
