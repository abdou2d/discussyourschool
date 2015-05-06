class AddConfirmationFieldsToSchools < ActiveRecord::Migration
  def change
      add_column :schools, :confirmed_at, :datetime
      add_column :schools, :confirmation_token, :string
  end
end
