class User < ActiveRecord::Base
  attr_accessible :age, :gender, :name, :username, :password
end
