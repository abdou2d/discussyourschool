class AddCommentsCountToStudents < ActiveRecord::Migration
    def change
        add_column :students, :comments_count, :integer, :default => 0

        Student.reset_column_information

        Student.all.each do |p|
            Student.update_counters p.id, :comments_count => p.comments.length
        end
    end
end
