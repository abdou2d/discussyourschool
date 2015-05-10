class AddPasswordResetToSchools < ActiveRecord::Migration
  def change
    add_column :schools, :password_reset_token, :string
    add_column :schools, :password_reset_sent_at, :datetime
  end
end
