ActiveAdmin.register Company do

  menu :priority => 2
  index do
    selectable_column
    column :name
    default_actions
  end
  filter :name

end
