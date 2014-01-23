class CreateDependents < ActiveRecord::Migration
  def change
    create_table :dependents do |t|
      t.string :first_name
      t.string :geneder
      t.date :dob
      t.string :relation
      t.integer :donar_id
      t.string :email

      t.timestamps
    end
  end
end
