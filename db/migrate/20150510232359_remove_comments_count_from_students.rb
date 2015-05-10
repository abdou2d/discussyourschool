class RemoveCommentsCountFromStudents < ActiveRecord::Migration
  def change
      remove_column :students, :comments_count
  end
end
