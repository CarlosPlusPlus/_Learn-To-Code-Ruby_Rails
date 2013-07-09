require 'pp'

class DecksController < ApplicationController
  # GET /decks
  # GET /decks.json
  def index
    @decks = Deck.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @decks }
    end
  end

  # GET /decks/1
  # GET /decks/1.json
  def show
    @deck = Deck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @deck }
    end
  end

  # GET /decks/new
  # GET /decks/new.json
  def new
    @deck = Deck.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @deck }
    end
  end

  # GET /decks/1/edit
  def edit
    @deck = Deck.find(params[:id])
  end

  # POST /decks
  # POST /decks.json
  def create
    # raise params.inspect

    pp params

    @deck = Deck.new
    
    @deck.name        = params[:deck][:name]
    @deck.description = params[:deck][:description]

    params[:cards].each do |c|
      card          = Card.new
      card.name     = c[:name]
      card.strength = c[:strength]

      @deck.cards   << card
    end

    if @deck.save
      redirect_to @deck, notice: 'Deck was successfully created.'
    else
      render action: "new"
    end
  end

  # PUT /decks/1
  # PUT /decks/1.json
  def update
    @deck = Deck.find(params[:id])

    respond_to do |format|
      if @deck.update_attributes(params[:deck])
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decks/1
  # DELETE /decks/1.json
  def destroy
    @deck = Deck.find(params[:id])
    @deck.destroy

    respond_to do |format|
      format.html { redirect_to decks_url }
      format.json { head :no_content }
    end
  end
end
