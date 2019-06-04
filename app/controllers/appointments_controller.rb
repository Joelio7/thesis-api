class AppointmentsController < ApplicationController
  before_action :get_schedule, only: [:show, :destroy, :new, :index]
  before_action :get_appointment, only: [:show, :destroy]
  include ParamsHelper
  def index
    appointments = []
    if @schedule
      @schedule.first.appointments.each do |appointment_id|
        appointment = Appointment.find(appointment_id).first
        appointments << appointment
      end
    return render json: appointments.sort_by {|appointment| appointment.start_time}
    else
    return render json: {status: "error", code: 2002, message: "schedule does not exist: please associate appointment with existing schedule"}
    end
  end
  def show
    if @appointment
      return render json: @appointment
    else
      return render json: {status: "error", code: 2005, message: "Appointment does not exist"}
    end
  end
  def destroy
    if !@schedule
      return render json: {status: "error", code: 2002, message: "schedule does not exist: please associate appointment with existing schedule"}
    end
    if !@appointment
      return render json: {status: "error", code: 2005, message: "Appointment does not exist"}
    end
      @schedule.first.appointments.delete(params[:appointment_id].to_i)
      return render json: @schedule
  end
  def new
    start = appointment_params[:start_time]
    finish = appointment_params[:end_time]
    if !validate_appointment(start, finish)
      return render json: {status: "error", code: 2001, message: "time not valid: please set a valid start and end time"}
    end
    if !@schedule
      return render json: {status: "error", code: 2002, message: "schedule does not exist: please associate appointment with existing schedule"}
    end
    if !validate_time(start, finish, params[:schedule_id])
      return render json: {status: "error", code: 2003, message: "Time conflict: please reschedule appointment"}
    end
    if ParamsHelper.validate_appointment_params(appointment_params) == true
      @created_appointment = Appointment.new(appointment_params[:name],params[:schedule_id],appointment_params[:start_time],appointment_params[:end_time])
      Schedule.add_appointment(params[:schedule_id], @created_appointment.object_id)
      return render json: @created_appointment
    else
      return render json: {status: "error", code: 2000, message: ParamsHelper.validate_appointment_params(appointment_params)}
    end
  end
  protected
  def appointment_params
    params.require(:appointment).permit(:name, :appointment_id, :start_time, :end_time, :schedule_id)
  end
  def validate_appointment(start_time, end_time)
    if start_time >= end_time
      return false
    else
      return true
    end
  end
  def validate_time(start_time,end_time,schedule_id)
    schedule = Schedule.find(schedule_id).first
    if schedule && schedule.appointments.length > 0
      schedule.appointments.each do |appointment_id|
        appointment = Appointment.find(appointment_id).first
        if  start_time.between?(appointment.start_time,appointment.end_time) || end_time.between?(appointment.start_time,appointment.end_time)
          puts appointment.start_time
          puts appointment.end_time
          return false
        end
      end
    end
    return true
  end

  def get_schedule
    @schedule = Schedule.find(params[:schedule_id])
    return
  end
  def get_appointment
    @appointment = Appointment.find(params[:appointment_id])
    return
  end
end
