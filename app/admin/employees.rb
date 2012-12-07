ActiveAdmin.register Employee do

  menu :priority => 4
  index do
    selectable_column
    column :company
    column :name
    column :designation
    column :email
    column :phone
    default_actions
  end
  filter :company
  filter :name
  filter :designation
  filter :email
  filter :phone

  form do |f|
    f.inputs "Employees" do
      f.input :company
      f.input :name, :label =>"Employee Name"
      f.input :designation
      f.input :email
      f.input :phone

    end
    f.buttons
  end

end