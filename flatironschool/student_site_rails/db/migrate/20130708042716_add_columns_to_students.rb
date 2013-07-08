class AddColumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :education, :text
    add_column :students, :work, :text
  end
end
