class Employee < ActiveRecord::Base
  attr_accessible :designation, :email, :name, :phone, :company_id

  belongs_to :company

  rails_admin do
    weight 3
    navigation_label 'Employees Database'

    list do
      field :company_id
      field :name
      field :designation
      field :email
      field :phone

    end
    edit do
      field :company_id
      field :name
      field :designation
      field :email
      field :phone
    end
  end

end
