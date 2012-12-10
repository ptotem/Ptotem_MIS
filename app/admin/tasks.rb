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

  show do |ad|
    attributes_table do
      row :action_point
      row :name
      row :due_date
      row "Responsible Person" do |task|
        Employee.find(task.responsible_person).name
      end
      row :status
      panel "Associated Sub-tasks" do
        table_for task.sub_tasks do
          column "Task Name" do |sub_task|
            sub_task.name
          end
          column "Due Date" do |sub_task|
            sub_task.due_date
          end
          column "Responsible Person" do |sub_task|
            Employee.find(sub_task.responsible_person).name
          end
          column "Status" do |sub_task|
            sub_task.status
          end
        end
      end
    end
    #active_admin_comments
  end


  
end
