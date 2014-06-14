class Tag < ActiveRecord::Base
  attr_accessible :name

  has_and_belongs_to_many :gift_requests
    validates_presence_of :name
end
