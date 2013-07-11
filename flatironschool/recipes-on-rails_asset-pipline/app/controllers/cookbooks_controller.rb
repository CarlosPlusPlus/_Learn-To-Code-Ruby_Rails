class CookbooksController < ApplicationController
  # GET /cookbooks
  # GET /cookbooks.json
  def index
    @cookbooks = Cookbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cookbooks }
    end
  end

  # GET /cookbooks/1
  # GET /cookbooks/1.json
  def show
    @cookbook = Cookbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cookbook }
    end
  end

  # GET /cookbooks/new
  # GET /cookbooks/new.json
  def new
    @cookbook = Cookbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cookbook }
    end
  end

  # GET /cookbooks/1/edit
  def edit
    @cookbook = Cookbook.find(params[:id])
  end

  # POST /cookbooks
  # POST /cookbooks.json
  def create
    @cookbook = Cookbook.new(params[:cookbook])

    respond_to do |format|
      if @cookbook.save
        format.html { redirect_to @cookbook, notice: 'Cookbook was successfully created.' }
        format.json { render json: @cookbook, status: :created, location: @cookbook }
      else
        format.html { render action: "new" }
        format.json { render json: @cookbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cookbooks/1
  # PUT /cookbooks/1.json
  def update
    @cookbook = Cookbook.find(params[:id])

    respond_to do |format|
      if @cookbook.update_attributes(params[:cookbook])
        format.html { redirect_to @cookbook, notice: 'Cookbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cookbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cookbooks/1
  # DELETE /cookbooks/1.json
  def destroy
    @cookbook = Cookbook.find(params[:id])
    @cookbook.destroy

    respond_to do |format|
      format.html { redirect_to cookbooks_url }
      format.json { head :no_content }
    end
  end
end
