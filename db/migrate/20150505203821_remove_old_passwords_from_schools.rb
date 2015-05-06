class RemoveOldPasswordsFromSchools < ActiveRecord::Migration
    def up
        remove_column :schools, :password
    end

    def down
        add_column :schools, :password
    end
end
