class Appointment
  attr_accessor :name, :start_time, :end_time, :schedule_id, :appointment_id
  def initialize(name,schedule_id,start_time, end_time)
    @name = name,
    @schedule_id = schedule_id
    @appointment_id = self.object_id
    @start_time = start_time
    @end_time = end_time
  end
  def self.find(appointment_id)
    objects = ObjectSpace.each_object(self).to_a
    objects.select { |appointment| appointment.appointment_id.to_s == appointment_id.to_s}
  end
end