class Customer < ActiveRecord::Base
  attr_accessible :customer_id, :key, :name, :password, :primary
end
