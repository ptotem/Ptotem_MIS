ActiveAdmin.register ActionPoint do



  menu :priority => 6
  form :partial => 'form'

  #controller do
  #  def show
  #    render :text => params
  #    @action_points = ActionPoint.all
  #  end
  #end

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
    column :responsible_person
    column :status
    default_actions
  end
  filter :meeting
  filter :name
  filter :due_date
  filter :responsible_person
  filter :status




end


