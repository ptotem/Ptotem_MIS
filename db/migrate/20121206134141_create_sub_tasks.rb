class CreateSubTasks < ActiveRecord::Migration
  def change
    create_table :sub_tasks do |t|
      t.integer :task_id
      t.string :name
      t.date :due_date
      t.string :status
      t.string :responsible_person

      t.timestamps
    end
  end
end
