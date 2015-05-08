class RemoveSlugsFromStudents < ActiveRecord::Migration
  def change
    remove_column :students, :slug, :string
  end
end
