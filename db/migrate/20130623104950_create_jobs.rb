class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.integer :sitter1_id
      t.integer :sitter2_id
      t.integer :sitter3_id
      t.integer :parent_id
      t.string :status
      t.decimal :amount_estimate
      t.decimal :amount_paid
      t.datetime :confirm_date
      t.datetime :pay_date
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
