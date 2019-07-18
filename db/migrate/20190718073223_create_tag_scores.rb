class CreateTagScores < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_scores do |t|
      t.references :tag, foreign_key: true
      t.integer :tag_score, null: false, default: 1
      t.timestamps
    end
  end
end
