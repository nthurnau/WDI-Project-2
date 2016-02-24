class User < ActiveRecord::Base
  has_secure_password
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  # after_initialize do
  #   self.profile unless self.build_profile()
  # end


  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

#record creation validation
validates :username, presence: true
validates :email, uniqueness: true



end
