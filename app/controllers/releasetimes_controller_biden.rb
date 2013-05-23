# class ReleasetimesController < ApplicationController
#   # GET /releasetimes
#   # GET /releasetimes.json
#   def index
#     @releasetimes = Releasetime.all

#     respond_to do |format|
#       format.html # index.html.erb
#       format.json { render json: @releasetimes }
#     end
#   end

#   # GET /releasetimes/1
#   # GET /releasetimes/1.json
#   def show
#     @releasetime = Releasetime.find(params[:id])

#     respond_to do |format|
#       format.html # show.html.erb
#       format.json { render json: @releasetime }
#     end
#   end

#   # GET /releasetimes/new
#   # GET /releasetimes/new.json
#   def new
#     @releasetime = Releasetime.new

#     respond_to do |format|
#       format.html # new.html.erb
#       format.json { render json: @releasetime }
#     end
#   end

#   # GET /releasetimes/1/edit
#   def edit
#     @releasetime = Releasetime.find(params[:id])
#   end

#   # POST /releasetimes
#   # POST /releasetimes.json
#   def create
#     @releasetime = Releasetime.new(params[:releasetime])

#     respond_to do |format|
#       if @releasetime.save
#         format.html { redirect_to @releasetime, notice: 'Releasetime was successfully created.' }
#         format.json { render json: @releasetime, status: :created, location: @releasetime }
#       else
#         format.html { render action: "new" }
#         format.json { render json: @releasetime.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # PUT /releasetimes/1
#   # PUT /releasetimes/1.json
#   def update
#     @releasetime = Releasetime.find(params[:id])

#     respond_to do |format|
#       if @releasetime.update_attributes(params[:releasetime])
#         format.html { redirect_to @releasetime, notice: 'Releasetime was successfully updated.' }
#         format.json { head :no_content }
#       else
#         format.html { render action: "edit" }
#         format.json { render json: @releasetime.errors, status: :unprocessable_entity }
#       end
#     end
#   end

#   # DELETE /releasetimes/1
#   # DELETE /releasetimes/1.json
#   def destroy
#     @releasetime = Releasetime.find(params[:id])
#     @releasetime.destroy

#     respond_to do |format|
#       format.html { redirect_to releasetimes_url }
#       format.json { head :no_content }
#     end
#   end
# end
