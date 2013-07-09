class Card < ActiveRecord::Base
  attr_accessible :deck_id, :name, :strength

  belongs_to :deck
end
