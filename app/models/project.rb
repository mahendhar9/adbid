class Project < ActiveRecord::Base
  belongs_to :user
  has_many :donations

  attr_accessor :still_needed
end
