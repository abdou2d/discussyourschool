class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :email
      t.string :mec_code
      t.string :password

      t.index :name, unique: true
      t.index :email, unique: true
      t.index :mec_code, unique: true

      t.timestamps
    end
  end
end
