class TurboMemoidsController < ApplicationController
  # GET /turbo_memoids
  # GET /turbo_memoids.json
  def index
    @turbo_memoids = TurboMemoid.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @turbo_memoids }
    end
  end

  # GET /turbo_memoids/1
  # GET /turbo_memoids/1.json
  def show
    @turbo_memoid = TurboMemoid.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @turbo_memoid }
    end
  end

  # GET /turbo_memoids/new
  # GET /turbo_memoids/new.json
  def new
    @turbo_memoid = TurboMemoid.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @turbo_memoid }
    end
  end

  # GET /turbo_memoids/1/edit
  def edit
    @turbo_memoid = TurboMemoid.find(params[:id])
  end

  # POST /turbo_memoids
  # POST /turbo_memoids.json
  def create
    @turbo_memoid = TurboMemoid.new(params[:turbo_memoid])

    respond_to do |format|
      if @turbo_memoid.save
        format.html { redirect_to @turbo_memoid, notice: 'Turbo memoid was successfully created.' }
        format.json { render json: @turbo_memoid, status: :created, location: @turbo_memoid }
      else
        format.html { render action: "new" }
        format.json { render json: @turbo_memoid.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /turbo_memoids/1
  # PUT /turbo_memoids/1.json
  def update
    @turbo_memoid = TurboMemoid.find(params[:id])

    respond_to do |format|
      if @turbo_memoid.update_attributes(params[:turbo_memoid])
        format.html { redirect_to @turbo_memoid, notice: 'Turbo memoid was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @turbo_memoid.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turbo_memoids/1
  # DELETE /turbo_memoids/1.json
  def destroy
    @turbo_memoid = TurboMemoid.find(params[:id])
    @turbo_memoid.destroy

    respond_to do |format|
      format.html { redirect_to turbo_memoids_url }
      format.json { head :no_content }
    end
  end
end
