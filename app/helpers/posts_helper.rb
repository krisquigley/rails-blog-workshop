module PostsHelper
	def change_timestamp(post)
		if post.created_at != post.updated_at
			"Updated at #{post.updated_at.strftime("%d/%m/%y at %H:%M")}"
		end
	end
end
