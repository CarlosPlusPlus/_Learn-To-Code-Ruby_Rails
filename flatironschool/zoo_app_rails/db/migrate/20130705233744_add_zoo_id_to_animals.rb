class AddZooIdToAnimals < ActiveRecord::Migration
  def change
    add_column :animals, :zoo_id, :integer
  end
end
