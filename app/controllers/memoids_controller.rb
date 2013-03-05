class MemoidsController < ApplicationController
  before_filter :authenticate_user!

  # POST /memoids
  # POST /memoids.json
  def create
    @user = User.find_by_id(params[:user_id])
    @memoid = @user.memoids.build(params[:memoid])
    
    #Replace with a call_back
    @memoid.release_dates = Settings.multipliers.map {|x| Time.now.to_date + x.days}

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


  # GET /memoids
  # GET /memoids.json
  # def index
  #   @memoids = User.memoids.all

  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.json { render json: @memoids }
  #   end
  # end

  # # GET /memoids/1
  # # GET /memoids/1.json
  # def show
  #   @memoid = Memoid.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @memoid }
  #   end
  # end

  # # GET /memoids/new
  # # GET /memoids/new.json
  # def new
  #   @memoid = Memoid.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @memoid }
  #   end
  # end

  # GET /memoids/1/edit
  # def edit
  #   @memoid = Memoid.find(params[:id])
  # end

  # PUT /memoids/1
  # PUT /memoids/1.json
  # def update
  #   @memoid = Memoid.find(params[:id])

  #   respond_to do |format|
  #     if @memoid.update_attributes(params[:memoid])
  #       format.html { redirect_to @memoid, notice: 'Your Memoly was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @memoid.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # # DELETE /memoids/1
  # # DELETE /memoids/1.json
  # def destroy
  #   @memoid = Memoid.find(params[:id])
  #   @memoid.destroy

  #   respond_to do |format|
  #     format.html { redirect_to memoids_url }
  #     format.json { head :no_content }
  #   end
  # end
end
