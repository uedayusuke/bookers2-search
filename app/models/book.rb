class Book < ApplicationRecord
	belongs_to :user
	validates :title, presence: true
	validates :body, presence: true, length: { maximum: 200 }

	def Book.search(search, user_or_book, how_search)
		if user_or_book == "2"
	  		if how_search == "1"
	  			Book.where(["title LIKE ?", "%#{search}%"])
	  		elsif how_search == "2"
	  			Book.where(["title LIKE ?", "%#{search}"])
	  		elsif how_search == "3"
	  			Book.where(["title LIKE ?", "#{search}%"])
	  		elsif how_search == "4"
	  			Book.where(["title LIKE ?", "#{search}"])
			else
				Book.all
			end
		end
	end
end
