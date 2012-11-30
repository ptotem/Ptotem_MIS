ActiveAdmin.register Product do

  menu :priority => 3
  index do
    selectable_column
    column :name
    default_actions
  end
  filter :name
  
end
