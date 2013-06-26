class AlphaUsersController < ApplicationController
  # before_filter :authenticate_user!, :except => [:new, :show]
  # load_and_authorize_resource
  # GET /alpha_users
  # GET /alpha_users.json

  filter_resource_access

  def index
    # @alpha_users = AlphaUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @alpha_users }
    end
  end

  # GET /alpha_users/1
  # GET /alpha_users/1.json
  def show
    # @alpha_user = AlphaUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @alpha_user }
    end
  end

  # GET /alpha_users/new
  # GET /alpha_users/new.json
  def new
    # @alpha_user = AlphaUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @alpha_user }
    end
  end

  # GET /alpha_users/1/edit
  def edit
    # @alpha_user = AlphaUser.find(params[:id])
  end

  # POST /alpha_users
  # POST /alpha_users.json
  def create
    # @alpha_user = AlphaUser.new(params[:alpha_user])

    respond_to do |format|
      if @alpha_user.save
        format.html { redirect_to root_url, notice: 'Thank you for your interest in MemolyApp.' }
        # format.json { render json: @alpha_user, status: :created, location: @alpha_user }
      else
        format.html { redirect_to root_url, notice: @alpha_user.errors.full_messages.first }
        format.json { render json: @alpha_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /alpha_users/1
  # PUT /alpha_users/1.json
  def update
    # @alpha_user = AlphaUser.find(params[:id])

    respond_to do |format|
      if @alpha_user.update_attributes(params[:alpha_user])
        format.html { redirect_to @alpha_user, notice: 'User was successfully updated.' }
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
    # @alpha_user = AlphaUser.find(params[:id])
    @alpha_user.destroy

    respond_to do |format|
      format.html { redirect_to alpha_users_url, notice: 'Alpha User has been successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
