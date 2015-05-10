class AddPostsCountToStudents < ActiveRecord::Migration
    def change
        add_column :students, :posts_count, :integer, :default => 0

        Student.reset_column_information

        Student.all.each do |p|
            Student.update_counters p.id, :posts_count => p.posts.length
        end
    end
end
