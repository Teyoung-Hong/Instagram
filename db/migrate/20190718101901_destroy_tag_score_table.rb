class DestroyTagScoreTable < ActiveRecord::Migration[5.2]
  def change
	  drop_table :tag_scores
  end
end
