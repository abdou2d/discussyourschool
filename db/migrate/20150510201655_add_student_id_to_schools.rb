class AddStudentIdToSchools < ActiveRecord::Migration
  def change
      add_reference :schools, :student, index: true
  end
end
