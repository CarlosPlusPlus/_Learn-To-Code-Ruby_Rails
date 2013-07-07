class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.text :name
      t.text :tagline
      t.text :bio
      t.text :treehouse_profile
      t.text :linkedin
      t.text :twitter
      t.text :github
      t.text :quote

      t.timestamps
    end
  end
end
