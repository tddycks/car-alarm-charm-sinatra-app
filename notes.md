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
- add license plate option for user sign up. I'll need to:
  - update User table
  - update User creation erb
- add ability for site to email user if their license plate has been reported
- add admin functionality
  - create admin table/model/controller
  - add relationships - user, event and comment belongs to admin
  - add hidden input field with admin_id to 1 on all create forms
  - create admin view pages
- build public index page (bootstrap)
- buid visuals of site with bootstrap


