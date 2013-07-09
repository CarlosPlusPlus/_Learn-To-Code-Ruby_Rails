class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :strength
      t.integer :deck_id

      t.timestamps
    end
  end
end
