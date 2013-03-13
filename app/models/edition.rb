class Edition < ActiveRecord::Base
  attr_accessible :code, :date, :is_promo, :name
end
