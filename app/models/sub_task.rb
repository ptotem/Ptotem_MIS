class SubTask < ActiveRecord::Base
  attr_accessible :due_date, :name, :status, :responsible_person, :task_id

  belongs_to :task

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
    navigation_label 'Sub-tasks Database'

    list do
      field :task_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
    edit do
      field :task_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
  end

end
