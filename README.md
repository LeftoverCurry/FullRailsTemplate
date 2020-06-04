# FullRailsTemplate
A template for rapid setup of my basic Rails flow.

## Description
A Rails template to let me quickly set up the gems and settings for new projects that I'm working on.

## Requirements:
* Rails 6.0.x
* Ruby 2.6.3

## Installation:
* For a new app: 
`$ rails new <AppName> -d <DB name (postgresql, sqlite3, ect)> -m /path/to/directory/VscodeDebugTemplate.rb`
* To add to an existing app: 
`$ rails app:template LOCATION=~/path/to/directory/VscodeDebugTemplate.rb`

## Contains:
* Factory_bot
* Faker
* Pry
* Rspec
* Devise
* Debase and Ruby-debug-ide for VSCode Debugging

## What it does:
* Installs listed gems.
* Initializes RSpec.
* Removes `/test` directory.
* Configures VSCode Debugging.
* Configures Devise.
* Optionally creates a new User model with Devise.
* Creates Database.
* Runs initial migrations.
* Initializes Git and creates first commit.
* Opens Github and reminds you to create a new repo.

