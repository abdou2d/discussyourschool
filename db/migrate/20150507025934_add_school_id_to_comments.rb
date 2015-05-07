class AddSchoolIdToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :school, index: true
    add_foreign_key :comments, :schools
  end
end
