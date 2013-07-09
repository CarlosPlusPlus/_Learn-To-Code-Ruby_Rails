# Dungeon Deck Builder

You are making a deck-building game. AWESOME. To test the efficacy and balance of the potential decks, your are building a program that simulates potential decks. Your friend, the dungeon master, has already written the `create` action for you. He writes things a little bit different than Avi, but it's always good to learn to work with different styles and patterns...

1. Using this, create the decks form in a partial called `decks/_form`. This form should allow you to create a deck and add multiple cards to it.

```ruby
def create
  @deck = Deck.new()
  @deck.name = params[:deck][:name]

  @deck.description = deck[:description]

  params[:cards].each do |card|
    card = Card.new
    card[:name] = card.name
    card[:strength] = card.strength

    @deck.cards << card
  end

  if @deck.save
    redirect_to @deck, notice: 'Deck was successfully created.'
  else
    render action: "new"
  end
end
```

While you worked on that, your amazing dungeon master made the `create` and `show` actions for the Card controller. Now create the card's form in `cards/_form` so that you can create a card an associate it with a specific deck.

```ruby
def create
  @card = Card.new
  @card.name = params[:card][:name]

  @card.deck = Deck.find(params[:deck_id])

  if @card.save
    redirect_to @card, notice: 'Card was successfully created.'
  else
    render action: "new"
  end
end

def show
  @card = Card.find(params[:id])
end
```

