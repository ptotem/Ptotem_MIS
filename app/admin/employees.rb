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

end