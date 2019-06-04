class Schedule
  attr_accessor :appointments, :schedule_id, :title
  def initialize(title)
    @title = title,
    @schedule_id = self.object_id
    @appointments = []
  end
  def self.all
    ObjectSpace.each_object(self).to_a
  end
  def self.add_appointment(schedule_id, appointment_id)
    Schedule.find(schedule_id).first.appointments << appointment_id
  end
  def self.find(schedule_id)
    objects = ObjectSpace.each_object(self).to_a
    objects.select { |schedule| schedule.schedule_id.to_s == schedule_id.to_s}
  end
end