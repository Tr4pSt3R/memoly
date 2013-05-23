class MemoidsController < ApplicationController
  before_filter :authenticate_user!
  # after_create  :calculate_default_release_dates

  # POST /memoids
  # POST /memoids.json
  def create
    @user = User.find_by_id(params[:user_id])
    @memoid = @user.memoids.build(params[:memoid])

    respond_to do |format|
      if @memoid.save
        @memoid.calculate_default_release_dates 
        
        format.html { redirect_to @user, notice: 'Your Memoid was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { redirect_to @user, alert: 'Failed to create Memoid' }
        format.json { render json: @memoid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/:id/memoid/:id
  def destroy
    @memoid = Memoid.find(params[:id])
    @memoid.destroy
    
    respond_to do |format|
      format.html { redirect_to @memoid.user, notice: 'Memoid was successfully deleted.'}
      format.json { head :no_content }
    end
  end
end
