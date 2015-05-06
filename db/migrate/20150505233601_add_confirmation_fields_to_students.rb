class AddConfirmationFieldsToStudents < ActiveRecord::Migration
  def change
      add_column :students, :confirmed_at, :datetime
      add_column :students, :confirmation_token, :string
  end
end
