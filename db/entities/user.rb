require 'active_record'

class User < ActiveRecord::Base
  has_many :movies
end