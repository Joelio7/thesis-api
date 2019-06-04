# Thesis API




## Schedules

#### GET SCHEDULES -  http:/localhost:3000/schedules
EXAMPLE: "curl -X GET -H  "Content-Type: application/json" http://localhost:3000/schedules"

#### CREATE SCHEDULE -  http:/localhost:3000/schedule
EXAMPLE: "curl -X POST -d '{"schedule": {"title": "Schedule title"}}' -H  "Content-Type: application/json" http://localhost:3000/schedule"

#### DELETE SCHEDULE -  http:/localhost:3000/schedule/:schedule_id
EXAMPLE: "curl -X DELETE -H  "Content-Type: application/json" http://localhost:3000/schedule/:schedule_id"

#### GET SCHEDULE -  http:/localhost:3000/schedule/:schedule_id
EXAMPLE: "curl -X GET -H  "Content-Type: application/json" http://localhost:3000/schedule/:schedule_id"


## APPOINTMENTS

#### GET APPOINTMENTS -  http:/localhost:3000/schedule/:schedule_id/appointments
EXAMPLE: "curl -X GET -H  "Content-Type: application/json" http://localhost:3000/schedule/:schedule_id/appointments"

#### CREATE APPOINTMENT -  http:/localhost:3000/schedule
"curl -X POST -d '{"appointment": {"name": "appointment", "start_time": 9000, "end_time": 18000}}' -H  "Content-Type: application/json" http:/local
host:3000/schedule/:schedule_id/appointment"

#### DELETE APPOINTMENT -  http:/localhost:3000/schedule/:schedule_id/appointment/:appointment_id
EXAMPLE: "curl -X DELETE -H  "Content-Type: application/json" http://localhost:3000/schedule/:schedule_id/appointment/:appointment_id"

#### GET APPOINTMENT -  http:/localhost:3000/appointment/:appointment_id
EXAMPLE: "curl -X GET -H  "Content-Type: application/json" http://localhost:3000/appointment/:appointment_id"
