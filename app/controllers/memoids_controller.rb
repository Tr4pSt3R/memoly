class MemoidsController < ApplicationController
  #GET /users/1/memoids/80/edit
  def edit
  	# binding.pry
  	@user = User.find(params[:user_id])
  	@memoid = @user.memoids.find(params[:id])
  end

  def destroy
  	@user 	= User.find(params[:user_id])
  	@memoid = Memoid.find(params[:id])
  	@memoid.destroy

  	respond_to do |format|
  		format.html { redirect_to @user, notice: "Memoid was successfully deleted" }
  		format.json { head :no_content }
  	end
  end

  def update
  	# binding.pry
  end
end
