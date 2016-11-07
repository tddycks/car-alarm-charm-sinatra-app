User
 - has many comments
 - has many events

 Event
 - has many comments
 - belongs to user

 Comment
 - belongs to user
 - belongs to event


---------------
Columns in DB:

Events:
address
car_model
license_number
Datetime
user_id

Users:
username
password
email

Comments:
content
datetime
user_id
event_id


--------------

Still to do:

- add 404 page and routes


