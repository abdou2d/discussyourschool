class RemoveMecCodeFromSchools < ActiveRecord::Migration
  def change
      remove_column :schools, :mec_code
  end
end
