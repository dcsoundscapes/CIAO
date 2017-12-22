	class Product < ApplicationRecord
		has_many :orders 
		has_many :comments
		validates :name, presence: true
		


		def highest_rating_comment
	  	comments.rating_desc.first
		end

		def average_rating
	  	comments.average(:rating).to_f
		end

		def get_latest_reviewer
	    $redis.get("lr_product:#{id}") # this returns the user's first name...
	  end

	  def views
	    $redis.get("product:#{id}") # this is equivalent to 'GET product:1'
	  end

	  def viewed
	    $redis.incr("product:#{id}") # this is equivalent to 'INC product:1'
	  end	
	end

