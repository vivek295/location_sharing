class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_uniqueness_of :username, :case_sensitive => false
  scope :all_except, ->(user) { where.not(id: user) }

  has_many :posts, dependent: :destroy

  before_create :create_username

  private

    def create_username
      self.username = self.email
    end
end
