class CreateScores < ActiveRecord::Migration[5.2]
  def change
    create_table :scores do |t|

      t.references :tag, foreign_key: true
      t.integer :level, null: false, default: 1
      t.timestamps
    end
  end
end
