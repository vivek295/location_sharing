class Post < ApplicationRecord
  belongs_to :user
  validates :longitude, presence: true
  validates :lattitude, presence: true

  validates :user_id, presence: true
end
