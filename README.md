# Image Web App

This application provide users with a platform to share images and comments on them.

Gems:

* Devise

* Active Storage

* Tailwind Css

* Stimulus-rails

* turbo-rails

# Getting started 
run to command to install the dependencies
`` bundle install ``

install active storage
`` $ rails active_storage:install ``

create the database
``$ rails db:create ``
migrate the database
``$ rails db:migrate ``

run the server 
`` bin/dev ``


# Possible upgrade 
- Using Hotwire will make the application real-time which will allow the user to delete and edit the visuals posted from the homepage.
- Adding a like button to give the app an interactive social media feel.
- Using a JS framework as a front-end providing data from a rails api with serializers

# Deployement
for deployement make sure to switch the production data base to postgresql
`` gem pg ``


