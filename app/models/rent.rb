class Rent < ApplicationRecord
  require "date_time_validator" 

  belongs_to :user
  belongs_to :equipment

  validates :start_date, presence: true
  validates :end_date, presence: true

  # this sucker takes care of validating datetime fields before rails gets there and
  # messes everything up. it should preserve the local time zone from the user input, 
  # and check for nil. takes date strings of the format m/d/yyyy m:h (am/pm)

  # this goes in the model

  # validates_with DateTimeValidator, :fields => [:start_date]
  # validates_with DateTimeValidator, :fields => [:end_date]

end
