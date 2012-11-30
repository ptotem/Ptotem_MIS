class CreateMeetings < ActiveRecord::Migration
  def change
    create_table :meetings do |t|
      t.string :meeting_type
      t.string :name
      t.date :date
      t.text :conversation
      t.integer :company_id
      t.integer :product_id
      t.timestamps
    end
  end
end
