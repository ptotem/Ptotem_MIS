class Meeting < ActiveRecord::Base
  #attr_accessible :action_point, :company_id, :conversation, :date, :name
  attr_accessible :company_id, :product_id, :conversation, :date, :name, :meeting_type, :action_points_attributes

  belongs_to :company
  belongs_to :product

  has_many :action_points, :dependent => :destroy
  accepts_nested_attributes_for :action_points, :allow_destroy => true

  rails_admin do
    weight 3
    navigation_label 'Meetings Database'

    list do
      field :company_id
      field :product_id
      field :meeting_type
      field :name
      field :date
      field :conversation
    end
    edit do
      field :company_id
      field :product_id
      field :meeting_type
      field :name
      field :date
      field :conversation
    end
  end

end
