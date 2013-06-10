class User < ActiveRecord::Base
  attr_accessible :name, :password, :user_id, :my_properties, :email, :validate
end
