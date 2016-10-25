User
 - has many comments
 - has many user_events
 - has many events through user_events

 Event
 - has many comments
 - has many user_events
 - has many users through user_events

 Comment
 - belongs to user
 - belongs to event



UserEvent
- belongs to user
- belongs to event

---------------
Columns in DB:

Events:
address
car_model
license_number
Datetime

Users:
username
password
email

Comments:
content (t.text?)
user_id
event_id

UserEvents:
user_id
event_id

