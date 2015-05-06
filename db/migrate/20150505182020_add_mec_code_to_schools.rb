class AddMecCodeToSchools < ActiveRecord::Migration
  def change
      add_column :schools, :mec_code, :integer
  end
end
