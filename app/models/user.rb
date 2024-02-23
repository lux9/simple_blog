class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  ## Associations
  has_many :posts
  has_many :comments
  has_many :comments_on_my_posts, through: :posts, source: :comments
  
  ## Validations

  def clear_username
    email.split("@").first.capitalize
  end

  def admin?
    admin
  end
end
