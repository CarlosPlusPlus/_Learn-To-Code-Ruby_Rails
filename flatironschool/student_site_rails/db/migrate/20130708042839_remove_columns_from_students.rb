class RemoveColumnsFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :tagline
    remove_column :students, :treehouse_profile
  end

  def down
    add_column :students, :treehouse_profile, :text
    add_column :students, :tagline, :text
  end
end
