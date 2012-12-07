ActiveAdmin.register Task do

  menu :priority => 7
  form :partial => 'form'

  index do
    selectable_column
    column :action_point
    column :name
    column :due_date
    #column :responsible_person
    column "Responsible Person" do |action_point|
      Employee.find(action_point.responsible_person).name
      end
    column :status
    default_actions
  end
  filter :meeting
  filter :action_point
  filter :name
  filter :due_date
  filter :responsible_person
  filter :status


  #form do |f|
  #  f.inputs "Tasks" do
  #    f.input :name
  #    f.input :responsible_person
  #    f.input :due_date
  #    f.input :status, :as => :select, :collection => ["Open", "Close"]
  #    f.input :action_point
  #  end
  #  f.buttons
  #end


  
end
