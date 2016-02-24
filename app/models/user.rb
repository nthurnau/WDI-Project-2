class User < ActiveRecord::Base
  has_secure_password
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  has_many :microposts, dependent: :destroy

  #implements the active relationships assosciation for the users
  has_many :active_relationships, class_name:  "Relationship",
                                foreign_key: "follower_id",
                                dependent:   :destroy
 has_many :passive_relationships, class_name:  "Relationship",
                                foreign_key: "followed_id",
                                dependent:   :destroy

  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  # after_initialize do
  #   self.profile unless self.build_profile()
  # end


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/CatDefault.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

#record creation validation
validates :username, presence: true
validates :email, uniqueness: true

# Defines a proto-feed.
 # See "Following users" for the full implementation.
  def feed
    Micropost.where("user_id = ?", id)
  end

# Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end


end
