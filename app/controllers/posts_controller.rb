class PostsController < ApplicationController
  filter_resource_access

  # POST /posts
  # POST /posts.json
  def create
    # @user = User.find_by_id(params[:user_id])
    # @post = current_user.posts.build

    respond_to do |format|
      if @post.save
        format.html { redirect_to user_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render json: user_post_path(@post), status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @posts = Post.all
    # @user = User.find_by_id(params[:user_id])
    # @post = @user.posts.find_by_id(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.build

    respond_to do |format|
      format.html { render action: "new" } # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @user = User.find_by_id params[:user_id]
    @post = @user.posts.find_by_id params[:id]
  end

  # # PUT /posts/1
  # # PUT /posts/1.json
  # def update
  #   @user = User.find_by_id(params[:user_id])
  #   @post = @user.posts.find_by_id(params[:id])

  #   respond_to do |format|
  #     if @post.update_attributes(params[:post])
  #       format.html { redirect_to @user, notice: 'Post was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @post.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to user_osts_url }
      format.json { head :no_content }
    end
  end
end
