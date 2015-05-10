class RemovePostsCountFromStudents < ActiveRecord::Migration
  def change
      remove_column :students, :posts_count
  end
end
