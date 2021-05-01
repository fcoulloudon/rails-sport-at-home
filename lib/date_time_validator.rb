require 'time'

class DateTimeValidator < ActiveModel::Validator
  DATETIME_FORMAT = "%Y-%m-%d"
  def validate(record)
    sd = Time.strptime(record.start_date, DATETIME_FORMAT)
    ed = Time.strptime(record.end_date, DATETIME_FORMAT)
    unless (sd || ed) === true
      record.errors.add(:top, "must be equal to 1")
    end
  end

  # def validate(record)
  #  options[:fields].each do |field|
  #    begin
  #      # gotta use the actual string and not the rails fucked time that it 'conveniently' converts to UTC
  #      record[field] = Time.strptime(field), DATETIME_FORMAT)                                                  
  #    rescue ArgumentError
  #      record.errors.add(field, "is either invalid or blank")
  #    end 
  #  end 
  #end 
end