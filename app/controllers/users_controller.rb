class UsersController < ApplicationController
  filter_resource_access
  
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    # @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    # @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    # @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    # @user = User.new(params[:user])
    binding.pry
    respond_to do |format|
      if @user.save

        # UserMailer.welcome_email(@user)
        format.html { redirect_to user_path(@user), notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    # @user = User.find(params[:id])
    commit = params[:commit]

    # TODO Optimise using Case_Switch 
    respond_to do |format|
      if @user.update_attributes(params[:user])
        if commit=='Add memoid'
          gflash :success => "Memoly was successfully created"
          format.html { 
            redirect_to @user,              
            :notice => "Memoid was successfully created"
          }
        elsif commit=='Add Time'
          format.html { redirect_to @user, notice: "Release Time was successfully updated"}
        else
          format.html { redirect_to @user, notice: 'User was successfully updated' }
          notice = "User was successfully updated"
          format.json { head :no_content }
        end        
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    # @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
