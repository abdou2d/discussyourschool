class AddClosePostToPosts < ActiveRecord::Migration
  def change
      add_column :posts, :close_post, :string
  end
end
