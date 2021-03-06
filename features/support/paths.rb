module NavigationHelpers
	def path_to(page_name)
		case page_name

		when /user profile page/
			users_path(page_name)
		else
			raise "Can't find mapping from \"#{page_name}\" to a path."
		end
	end
end

World(NavigationHelpers)