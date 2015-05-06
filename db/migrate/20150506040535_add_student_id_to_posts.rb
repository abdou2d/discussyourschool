class AddStudentIdToPosts < ActiveRecord::Migration
  def change
    add_reference :posts, :student, index: true
    add_foreign_key :posts, :students
  end
end
