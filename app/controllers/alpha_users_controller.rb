class AlphaUsersController < ApplicationController
  # GET /alpha_users
  # GET /alpha_users.json
  def index
    @alpha_users = AlphaUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alpha_users }
    end
  end

  # GET /alpha_users/1
  # GET /alpha_users/1.json
  def show
    @alpha_user = AlphaUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alpha_user }
    end
  end

  # GET /alpha_users/new
  # GET /alpha_users/new.json
  def new
    @alpha_user = AlphaUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alpha_user }
    end
  end

  # GET /alpha_users/1/edit
  def edit
    @alpha_user = AlphaUser.find(params[:id])
  end

  # POST /alpha_users
  # POST /alpha_users.json
  def create
    @alpha_user = AlphaUser.new(params[:alpha_user])

    respond_to do |format|
      if @alpha_user.save
        format.html { redirect_to @alpha_user, notice: 'Alpha user was successfully created.' }
        format.json { render json: @alpha_user, status: :created, location: @alpha_user }
      else
        format.html { render action: "new" }
        format.json { render json: @alpha_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alpha_users/1
  # PUT /alpha_users/1.json
  def update
    @alpha_user = AlphaUser.find(params[:id])

    respond_to do |format|
      if @alpha_user.update_attributes(params[:alpha_user])
        format.html { redirect_to @alpha_user, notice: 'Alpha user was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @alpha_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /alpha_users/1
  # DELETE /alpha_users/1.json
  def destroy
    @alpha_user = AlphaUser.find(params[:id])
    @alpha_user.destroy

    respond_to do |format|
      format.html { redirect_to alpha_users_url }
      format.json { head :no_content }
    end
  end
end
