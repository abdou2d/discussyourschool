class AddAnonymousToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :anonymous, :string
  end
end
