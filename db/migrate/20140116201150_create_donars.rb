class CreateDonars < ActiveRecord::Migration
  def change
    create_table :donars do |t|
      t.string :fname
      t.string :lname
      t.date :dob
      t.string :emailid
      t.string :phone
      t.string :mobile
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.integer :zip
      t.string :country
      t.integer :createdBy
      t.integer :updatedBy

      t.timestamps
    end
  end
end
