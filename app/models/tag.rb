class Tag < ApplicationRecord

  # associations
  belongs_to :post
  has_many :tag_scores

  # cocoon
  accepts_nested_attributes_for :tag_scores, allow_destroy: true
end
