class Relationship < ApplicationRecord

  # associations
  belongs_to :user
  belongs_to :follow, class_name: 'User'

  # validations
  validates :user_id, presence: true
  validates :follow_id, presence: true

end
