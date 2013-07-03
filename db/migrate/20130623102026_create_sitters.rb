class CreateSitters < ActiveRecord::Migration
  def change
    create_table :sitters do |t|
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :mobile_phone
      t.string :email
      t.string :parent_name
      t.string :parent_phone
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :contact_preference
      t.decimal :hourly_rate
      t.string :rating
      t.text :skills
      t.boolean :availability_ind
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
