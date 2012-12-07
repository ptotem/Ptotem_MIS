class ActionPoint < ActiveRecord::Base

  attr_accessible :name, :responsible_person, :due_date, :status, :meeting_id, :tasks_attributes

  belongs_to :meeting
  has_many :tasks, :dependent => :destroy
  accepts_nested_attributes_for :tasks, :allow_destroy => true

  before_save :check_due_date

  private
  def check_due_date
    if Date.today > self.due_date
      self.status = 'Overdue'
    end
  end


  rails_admin do
    weight 3
    navigation_label 'Action Points Database'

    list do
      field :meeting_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
    edit do
      field :meeting_id
      field :name
      field :due_date
      field :responsible_person
      field :status
    end
  end

end
