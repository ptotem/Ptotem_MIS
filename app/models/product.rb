class Product < ActiveRecord::Base
  attr_accessible :name

  has_many :meetings
  has_many :companies, :through => :meetings

  rails_admin do
    weight 3
    navigation_label 'Products Database'

    list do
      field :name
    end
    edit do
      field :name
    end
  end

end
