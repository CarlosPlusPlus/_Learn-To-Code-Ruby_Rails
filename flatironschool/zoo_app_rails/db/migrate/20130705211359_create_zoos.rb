class CreateZoos < ActiveRecord::Migration
  def change
    create_table :zoos do |t|
      t.text :name

      t.timestamps
    end
  end
end
