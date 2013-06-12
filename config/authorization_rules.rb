authorization do 
	role :admin do 
		has_permission_on :users, :to => :manage
	end

	role :guest do 
		# has_permission_on :users, :to => [:update, :show, :new]
	end
end

privileges do 
	privilege :manage do 
		includes :show, :update
	end
end