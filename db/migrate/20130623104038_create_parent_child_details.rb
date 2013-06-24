class CreateParentChildDetails < ActiveRecord::Migration
  def change
    create_table :parent_child_details do |t|
      t.integer :parent_id
      t.string :name
      t.date :birthday
      t.text :medication
      t.string :pediatrician_name
      t.string :pediatrician_phone
      t.string :dentist_name
      t.string :dentist_phone
      t.string :school
      t.string :grade
      t.text :activities
      t.text :allergies
      t.string :blood_type
      t.string :height
      t.string :weight
      t.string :hair_color
      t.string :eye_color
      t.text :other_info

      t.timestamps
    end
  end
end
