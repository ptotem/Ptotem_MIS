class Employee < ActiveRecord::Base
  attr_accessible :designation, :email, :name, :phone, :company_id, :admin

  belongs_to :company

  before_save :check_employee

  private
  def check_employee
    if self.company_id == 1
      self.admin = true
      AdminUser.create(:email => self.email, :password => 'ptotem123')
    end
  end

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
