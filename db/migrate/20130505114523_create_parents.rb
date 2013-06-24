class CreateParents < ActiveRecord::Migration
  def change
    create_table :parents do |t|
      t.string :family_name
      t.string :father_name
      t.string :mother_name
      t.string :home_phone
      t.string :work_phone
      t.string :mobile_phone1
      t.string :mobile_phone2
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :email1
      t.string :email2
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
