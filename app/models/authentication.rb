class Authentication < ActiveRecord::Base
  belongs_to :user

  attr_accessible :provider, :uid
  validates_presence_of :uid
  validates_presence_of :provider
end
