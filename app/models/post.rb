class Post < ApplicationRecord
  ## Associations
  belongs_to :user
  has_many :comments

  ## Validations
  validates :title, :body, presence: true
end
