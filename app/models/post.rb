class Post < ApplicationRecord

  # associations
  belongs_to :user
  has_many :comments
  has_many :tags

  # attachment
  attachment :post_image

  # cocoon nest
  accepts_nested_attributes_for :tags, allow_destroy: true

end
