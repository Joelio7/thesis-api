module ParamsHelper
  def self.validate_appointment_params(params)
  end
  def self.validate_schedule_params(params)
    if !params[:title] || !params[:title].is_a?(String)
      return 'please enter a valid string title'
    end
    return true
  end
  def self.validate_appointment_params(params)
    if !params[:name] || !params[:name].is_a?(String)
      return 'please enter a valid name'
    end
    if !params[:start_time] || !params[:start_time].is_a?(Integer)
      return 'please enter a valid start time'
    end
    if !params[:end_time] || !params[:end_time].is_a?(Integer)
      return 'please enter a valid end time'
    end
    return true
  end
  def self.schedule_exists?(schedule_id)
     schedules = Schedule.all
     schedules.each do |schedule|
        if schedule.schedule_id == schedule_id
          puts true
          return true
        end
     end
  end
end