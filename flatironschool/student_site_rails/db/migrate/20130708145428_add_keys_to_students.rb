class AddKeysToStudents < ActiveRecord::Migration
  def change
    add_column :students, :class, :string
    add_column :students, :grade_id, :integer
  end
end
