class CreateAcceptedJobs < ActiveRecord::Migration
  def change
    create_table :accepted_jobs do |t|
      t.integer :job_id
      t.integer :sitter_id

      t.timestamps
    end
  end
end
