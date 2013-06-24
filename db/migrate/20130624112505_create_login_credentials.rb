class CreateLoginCredentials < ActiveRecord::Migration
  def change
    create_table :login_credentials do |t|
      t.integer :user_id
      t.string :password

      t.timestamps
    end
  end
end
