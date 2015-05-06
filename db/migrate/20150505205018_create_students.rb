class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :school_name
      t.string :name
      t.string :birthday
      t.string :grade
      t.string :email
      t.string :password
      t.string :password_digest

      t.index :name, unique: true
      t.index :email, unique: true

      t.timestamps
    end
  end
end
