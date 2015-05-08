class AddReopenPostToPosts < ActiveRecord::Migration
  def change
      add_column :posts, :reopen_post, :string
  end
end
