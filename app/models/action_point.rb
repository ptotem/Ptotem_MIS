class ActionPoint < ActiveRecord::Base

  #attr_accessible :action, :due_date, :responsibility, :status, :meeting_id, :parent_action_id
  attr_accessible :name, :responsible_person, :due_date, :status, :meeting_id, :tasks_attributes

  belongs_to :meeting
  has_many :tasks, :dependent => :destroy


  before_save :check_due_date

  private

  def check_due_date
    if Date.today > self.due_date
      self.status = 'Overdue'
      #self.save!
    #elsif self.due_date < Date.today
    #  self.errors.add(:due_date, "Date Passed")
    #  return false
    end
  end

  accepts_nested_attributes_for :tasks, :allow_destroy => true


  rails_admin do
    weight 3
    navigation_label 'Action Points Database'

    list do
      field :meeting_id
      field :name
      field :due_date
      field :responsible_person
      field :status
      #field :parent_action_id
    end
    edit do
      field :meeting_id
      field :name
      field :due_date
      field :responsible_person
      field :status
      #field :parent_action_id
    end
  end

end
#ActionPoint.find(self.parent_action_id)