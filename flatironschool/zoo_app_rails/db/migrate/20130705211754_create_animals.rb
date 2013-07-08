class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.text :species
      t.integer :count

      t.timestamps
    end
  end
end
