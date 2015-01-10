class Sensor < ActiveRecord::Base
  validates :value, presence: true
  validates :type, presence: true
end