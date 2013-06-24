class CreateSitterParentLinks < ActiveRecord::Migration
  def change
    create_table :sitter_parent_links do |t|
      t.integer :sitter_id
      t.integer :parent_id

      t.timestamps
    end
  end
end
