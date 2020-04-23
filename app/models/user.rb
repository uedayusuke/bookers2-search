class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
  validates :introduction, length: { maximum: 50 }
  attachment :profile_image
  has_many :books, dependent: :destroy

  def User.search(search, user_or_book)
  	if user_or_book == "1"
  		User.where(["name LIKE ?", "%#{search}"])
  	else
  		User.all
  	end
  end
end
