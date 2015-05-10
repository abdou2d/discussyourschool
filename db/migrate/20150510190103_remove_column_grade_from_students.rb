class RemoveColumnGradeFromStudents < ActiveRecord::Migration
  def change
      remove_column :students, :grade
  end
end
