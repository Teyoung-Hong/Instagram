class User < ApplicationRecord
  # devise
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # associations
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

  # attachment
  attachment :user_image

  # functions
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end

  # functions
  def self.search(way, search)
    case 
    when way == "1"
      where(["user_name LIKE ?", "#{search}%"])
    when way == "2"
      where(["user_name LIKE ?", "%#{search}"])
    when way == "3"
      where(["user_name LIKE ?", "#{search}"])
    when way == "4"
      where(["user_name LIKE ?", "%#{search}%"])
    else   
      all  
    end       
  end
end
