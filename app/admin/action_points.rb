ActiveAdmin.register ActionPoint do



  menu :priority => 6
  form :partial => 'form'

  index do
    selectable_column
    #column :id
    #column :meeting
    column "Company" do |action_point|
      action_point.meeting.company.name
    end
    column "Product" do |action_point|
      action_point.meeting.product.name
    end
    column "Meeting" do |action_point|
      action_point.meeting.name
    end
    column "Action Point Name", :name
    column :due_date
    column "Responsible Person" do |action_point|
      Employee.find(action_point.responsible_person).name
    end
    #column :responsible_person

    column :status
    default_actions
  end
  filter :meeting
  filter :name
  filter :due_date
  filter :responsible_person
  filter :status, :as => :select, :collection => ["Open", "Close", "Overdue"]



  show do |ad|
    attributes_table do
      row :meeting
      row :name
      row :due_date
      row "Responsible Person" do |action_point|
        Employee.find(action_point.responsible_person).name
      end
      row :status
      panel "Associated Tasks" do
        table_for action_point.tasks do
          column "Task Name" do |task|
            task.name
          end
          column "Due Date" do |task|
            task.due_date
          end
          column "Responsible Person" do |task|
            Employee.find(task.responsible_person).name
          end
          column "Status" do |task|
            task.status
          end
        end
      end
    end
    #active_admin_comments
  end


end


