class Task < ActiveRecord::Base
  attr_accessible :action_point_id, :parent_task_id, :due_date, :name, :responsible_person, :status

  belongs_to :action_point

  #working code starts
    belongs_to :task, :class_name => 'Task'

    #has_many :action_points, :foreign_key => "parent_action_id", :class_name => "ActionPoint"
    has_many :tasks
    accepts_nested_attributes_for :tasks, :allow_destroy => true
  #working code ends

  before_save :check_due_date

  private

  def check_due_date
    if  Date.today > self.due_date
      self.status = 'Overdue'
      #self.save!
      #elsif self.due_date < Date.today
      #  self.errors.add(:due_date, "Date Passed")
      #  return false
    end
  end

  rails_admin do
    visible false
    weight 3
    navigation_label 'Tasks Database'

    list do
      field :action_point_id
      field :parent_task_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
    edit do
      field :action_point_id
      field :parent_task_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
  end

end
