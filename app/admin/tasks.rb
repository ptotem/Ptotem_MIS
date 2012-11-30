ActiveAdmin.register Task do

  menu :priority => 7
  index do
    selectable_column
    #column :id
    #column :meeting
    column :action_point
    column :parent_task_id
    #column "Parent task" do |task|
    #  task.parent_task_id
    #end
    column "Sub-Task", :name
    column :due_date
    column :responsible_person
    column :status
    default_actions
  end
  filter :meeting
  filter :action_point
  #filter :parent_task_id
  filter :name
  filter :due_date
  filter :responsible_person
  filter :status

  #working code start
  form do |f|
    f.inputs "Tasks" do
      #f.input :action_point
      f.input :parent_task_id, :as => :select, :collection => Task.all, :member_label => lambda { |i| i.name }
      f.input :name, :label =>"Sub Task"
      f.input :responsible_person
      f.input :due_date
      f.input :status, :as => :select, :collection => ["Open", "Close"]
    end
    f.buttons
  end
  #working code ends


    #show do |task|
    #  attributes_table do
    #    row :name
    #
    #  end
    #  active_admin_comments
    #end

  
end
