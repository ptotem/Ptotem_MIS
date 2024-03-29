class Task < ActiveRecord::Base
  attr_accessible :action_point_id, :due_date, :name, :responsible_person, :status

  belongs_to :action_point

  has_many :sub_tasks, :dependent => :destroy
  accepts_nested_attributes_for :sub_tasks, :allow_destroy => true


  before_save :check_due_date

  private
  def check_due_date
    if Date.today > self.due_date
      self.status = 'Overdue'
    end
  end

  rails_admin do
    visible false
    weight 3
    navigation_label 'Tasks Database'

    list do
      field :action_point_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
    edit do
      field :action_point_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
  end

end
