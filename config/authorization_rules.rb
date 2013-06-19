authorization do 
	role :admin do 
		has_permission_on [:users, :alpha_users, :memoids], :to => :manage
	end

	role :beta_user do
		has_permission_on :memoids, :to => [:read]
	end

	role :guest do 
		has_permission_on :alpha_users, :to => :express_interest
	end
end

privileges do 
	privilege :manage do 
		includes :show, :update, :edit, :create, :destroy, :new
	end

	privilege :express_interest do 
		includes :new, :show, :edit, :update, :new
	end
end