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
  filter :status


end


