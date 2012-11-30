class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.date :due_date
      t.string :responsible_person
      t.string :status
      t.integer :parent_task_id
      t.integer :action_point_id

      t.timestamps
    end
  end
end
