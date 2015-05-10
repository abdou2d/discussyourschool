class AddCounterCacheToStudentsPosts < ActiveRecord::Migration
  def change
      add_column :students, :posts_count, :integer
  end
end
