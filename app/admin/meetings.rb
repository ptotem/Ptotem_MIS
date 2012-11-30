ActiveAdmin.register Meeting do

  menu :priority => 5
  form :partial => 'form'

  index do
    selectable_column
    column :company
    column "Product" do |meeting|
      meeting.product.name
    end
    column :meeting_type
    column "Agenda", :name
    column :date
    #column :conversation
    column "Action Points" do |meeting|
      meeting.action_points.count
    end
    default_actions
  end
  filter :company
  filter :product
  filter :meeting_type
  filter :name
  filter :date
  #filter :conversation

  show do |ad|
    attributes_table do
      row :company
      row :product
      row :meeting_type
      row :name
      row :conversation
      row :date
      panel "Associated Action Points" do
        table_for meeting.action_points do
          column "Action Point Name" do |action_point|
            action_point.name if action_point.status == 'Open'
          end
          column "Action Point Name" do |action_point|
            action_point.status if action_point.status == 'Open'
          end
        end
      end
    end
    #active_admin_comments
  end



end
