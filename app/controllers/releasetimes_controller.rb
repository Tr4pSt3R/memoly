class ReleasetimesController < ApplicationController
	def new
		@user = User.find_by_id(params[:id])
		@releasetime = @user.build_releasetime
		
		respond_to do |format|
			format.html # new.html.erb
			format.json { render json: @user.releasetime}
		end
	end

	def create
		@user = User.find_by_id(params[:user_id])
		@releasetime = @user.build_releasetime(params[:releasetime])

		respond_to do |format|
		  if @releasetime.save
		    format.html { redirect_to @user, notice: 'Your Release Time was successfully created.' }
		    format.json { render json: @user, status: :created, location: @user }
		  else
		    format.html { redirect_to @user, alert: 'Failed to create Release Time' }
		    format.json { render json: @releasetime.errors, status: :unprocessable_entity }
		  end
		end
	end
end
