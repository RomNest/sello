module PostsHelper

	def get_categories
		Category.order("RANDOM()").limit(6)
	end

end
