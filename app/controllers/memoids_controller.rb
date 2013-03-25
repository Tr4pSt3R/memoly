class MemoidsController < ApplicationController
  before_filter :authenticate_user!

  # POST /memoids
  # POST /memoids.json
  def create
    @user = User.find_by_id(params[:user_id])
    @memoid = @user.memoids.build(params[:memoid])
    
    #Replace with a call_back
    # @memoid.release_dates = Settings.multipliers.map {|x| Time.now.to_date + x.days}

    respond_to do |format|
      if @memoid.save
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
    # @user = User.find_by_id(params[:user_id])
    # @memoid = @user.memoids.find_by_id(params[:id])
    # binding.pry
    # @user = User.find_by_id(params[:user_id])
    # @memoid = @user.memoids.find_by_id(params[:id])
    # Memoid.where("user_id=? AND id=?", params[:id], params[:user_id]).first
    @memoid = Memoid.find(params[:id])
    @memoid.destroy

    # id = params[:id]
    # @memoid = current_user.memoids.find_by_id(id)
    # @memoid.destroy

    respond_to do |format|
      format.html { redirect_to @memoid.user, notice: 'Memoid was successfully deleted.'}
      format.json { head :no_content }
    end
  end
end
