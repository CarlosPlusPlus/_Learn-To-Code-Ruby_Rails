class CreateMessages < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.string :content
      t.string :sender
      t.string :receiver
    end
  end

  def down
    drop_table :messages
  end
end
