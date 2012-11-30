class CreateActionPoints < ActiveRecord::Migration
  def change
    create_table :action_points do |t|
      t.string :name
      t.string :responsible_person
      t.date :due_date
      t.string :status
      #t.integer :parent_action_id
      t.integer :meeting_id
      t.timestamps
    end
  end
end
