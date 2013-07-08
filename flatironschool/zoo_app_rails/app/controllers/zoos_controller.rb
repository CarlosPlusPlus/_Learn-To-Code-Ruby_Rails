class ZoosController < ApplicationController
  # GET /zoos
  # GET /zoos.json
  def index
    @zoos = Zoo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @zoos }
    end
  end

  # GET /zoos/1
  # GET /zoos/1.json
  def show
    @zoo = Zoo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @zoo }
    end
  end

  # GET /zoos/new
  # GET /zoos/new.json
  def new
    @zoo = Zoo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @zoo }
    end
  end

  # GET /zoos/1/edit
  def edit
    @zoo = Zoo.find(params[:id])
  end

  # POST /zoos
  # POST /zoos.json
  def create
    @zoo = Zoo.new(params[:zoo])

    respond_to do |format|
      if @zoo.save
        format.html { redirect_to @zoo, notice: 'Zoo was successfully created.' }
        format.json { render json: @zoo, status: :created, location: @zoo }
      else
        format.html { render action: "new" }
        format.json { render json: @zoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /zoos/1
  # PUT /zoos/1.json
  def update
    @zoo = Zoo.find(params[:id])

    respond_to do |format|
      if @zoo.update_attributes(params[:zoo])
        format.html { redirect_to @zoo, notice: 'Zoo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @zoo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /zoos/1
  # DELETE /zoos/1.json
  def destroy
    @zoo = Zoo.find(params[:id])
    @zoo.destroy

    respond_to do |format|
      format.html { redirect_to zoos_url }
      format.json { head :no_content }
    end
  end
end
