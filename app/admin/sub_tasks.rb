ActiveAdmin.register SubTask do


  #menu false
  menu :priority => 8
  index do
    selectable_column
    column :task
    column :name
    column :due_date
    column :responsible_person
    column :status
    default_actions
  end
  filter :task
  filter :name
  filter :due_date
  filter :responsible_person
  filter :status


  form do |f|
    f.inputs "Sub-tasks" do
      f.input :name, :label =>"Sub Task"
      f.input :responsible_person
      f.input :due_date
      f.input :status, :as => :select, :collection => ["Open", "Close"]
      f.input :task
    end
    f.buttons
  end
  
end
