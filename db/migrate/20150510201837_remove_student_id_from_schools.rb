class RemoveStudentIdFromSchools < ActiveRecord::Migration
    def change
        remove_reference :schools, :student, index: true
    end
end
