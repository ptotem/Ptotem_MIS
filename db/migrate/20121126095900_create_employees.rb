class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.string :email
      t.integer :phone
      t.integer :company_id
      t.timestamps
    end
  end
end
