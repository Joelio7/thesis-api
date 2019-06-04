
class SchedulesController < ApplicationController
  include ParamsHelper
  before_action :get_schedules, only: [:index, :destroy]
  before_action :get_schedule, only: [:show, :destroy]
  
  def index
    if @schedules
      return render json: @schedules
    else
      return render json: {status: "error", code: 1004, message: "No schedules exist: please create schedule"}
    end
  end
  def destroy
    if !@schedule
      return render json: {status: "error", code: 1004, message: "No schedules exist: please create schedule"}
    else
      if @schedule.first.appointments.length > 0
        @schedule.first.appointments.map do |appointment_id|
          appointment = Appointment.find(appointment_id)
          appointment = nil
          appointment_id = nil
        end
      end
    @schedule = nil
    return render json: @schedules
    end
  end
  def new
    if ParamsHelper.validate_schedule_params(schedule_params) == true
      @created_schedule = Schedule.new(schedule_params)
      return render json: @created_schedule
    else
      return render json: {status: "error", code: 1000, message: ParamsHelper.validate_schedule_params(schedule_params)}
    end
  end

  def show
    if @schedule
      return render json: @schedule
    else
      return render json: {status: "error", code: 1001, message: "schedule not found"}
    end
  end
  
  protected
  def get_schedules
    @schedules = Schedule.all
    return
  end
  def get_schedule
    @schedule = Schedule.find(params[:id])
    return
  end
  def schedule_params
    params.require(:schedule).permit(:title, :appointments)
  end
end
