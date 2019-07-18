class Tag < ApplicationRecord

  # associations
  belongs_to :post
  has_many :scores

  # cocoon
  accepts_nested_attributes_for :scores, allow_destroy: true

  # functions
  def self.search(way, search)
    case
    when way == "1"
      where(["hashtag LIKE ?", "#{search}%"])
    when way == "2"
      where(["hashtag LIKE ?", "%#{search}"])
    when way == "3"
      where(["hashtag LIKE ?", "#{search}"])
    when way == "4"
      where(["hashtag LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
