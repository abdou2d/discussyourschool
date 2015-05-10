class RemoveSchoolIdFromStudents < ActiveRecord::Migration
  def change
      remove_reference :students, :school, index: true
      remove_foreign_key :students, :schools
  end
end
