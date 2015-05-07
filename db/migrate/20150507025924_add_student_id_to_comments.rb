class AddStudentIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :student, index: true
    add_foreign_key :comments, :students
  end
end
