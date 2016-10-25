Users
 - has many comments
 - has many user_events
 - has many events through user_events

 Comments
 - belongs to user
 - belongs to event


 Events
 - has many comments
 - has many user_events
 - has many users through user_events

UserEvent
- belongs to user
- belongs to event

---------------
Columns in DB:

Events:
address
car_description
license_number
Timestamp

Users:
username
password
email

Comments:
content
user.id
event.id

UserEvents:
user_id
event_id

