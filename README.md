# README

#Steps for setting up application
Ruby Version: 2.4.1

# Clone git Repository
git clone git@github.com:viveksingh295/location_sharing.git

# Enter application Folder
cd location_sharing

# Install bundler gem
gem install bundler

# Bundle Install all gems in gemfile
bundle install

# DB Setup
// you may need to update the config/database.yml for updating username and password 

rails db:create
rails db:migrate

# Seed data to DB
rails db:seed

# Start server
rails s

#Visit Application at http://localhost:3000

