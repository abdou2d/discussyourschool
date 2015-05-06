class AddSchoolNameToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :school_name, :string
  end
end
