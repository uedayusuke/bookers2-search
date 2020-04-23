class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }

	def Book.search(search, user_or_book)
		if user_or_book == "2"
			Book.where(["title LIKE ?", "%#{search}"])
		else
			Book.all
		end
	end
end
