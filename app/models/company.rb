class Company < ActiveRecord::Base
  attr_accessible :name

  has_many :meetings
  has_many :products, :through => :meetings
  has_many :employees, :dependent => :destroy

  rails_admin do
    weight 3
    navigation_label 'Companies Database'

    list do
      field :name
    end
    edit do
      field :name
    end
  end

end
