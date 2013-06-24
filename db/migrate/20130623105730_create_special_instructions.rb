class CreateSpecialInstructions < ActiveRecord::Migration
  def change
    create_table :special_instructions do |t|
      t.text :instruction
      t.integer :parent_id
      t.integer :sitter_id
      t.integer :job_id

      t.timestamps
    end
  end
end
