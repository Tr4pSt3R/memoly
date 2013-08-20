authorization do 
	role :admin do 
		description "to be assigned to an administrative personnel"
		has_permission_on [:alpha_users, :memoids], :to => :manage
		has_permission_on :users, :to => :manage 
		has_permission_on :posts, :to => :manage
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
		includes :update, :edit, :create, :destroy, :new, :show, :index
	end

	privilege :express_interest do 
		includes :new, :show, :edit, :update, :create
	end
end