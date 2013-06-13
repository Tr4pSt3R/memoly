authorization do 
	role :admin do 
		has_permission_on :users, :to => :manage
	end

	role :guest do 
		has_permission_on :alpha_users, :to => :express_interest
	end
end

privileges do 
	privilege :manage do 
		includes :show, :update
	end

	privilege :express_interest do 
		includes :new, :show, :edit, :update
	end
end