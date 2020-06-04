# frozen_string_literal: true

# Template Name: Full Setup With VSCode Debugging
# Author: Tripp Martin
# Instructions: $ rails new <AppName> -d <DB name (postgresql, sqlite3, ect)> -m /path/to/directory/full_setup.rb

# allows the use of relative paths within the template
def source_paths
  [__dir__]
end

# Builds gemfile with basic debugging, rspec, Factorybot
def add_gems
  gem 'devise'

  gem_group :development, :test do
    gem 'factory_bot'
    gem 'pry-rails'
    gem 'rspec-rails'
    gem 'debase'
    gem 'ruby-debug-ide'
    gem 'faker'
  end
end

# Configure RSpec

def install_rspec
  run 'bin/spring stop'
  generate 'rspec:install'
  remove_dir 'test'
end

# Configure debugger
def configure_debugger
  # Set up launch.json file for VSCode debugging
  run 'mkdir ./.vscode'
  copy_file 'launch_template.json', './.vscode/launch.json'

  # Create RSpec binstub to fix debugging error when debugging tests
  run 'bundle binstubs rspec-core'
end

# Creates a devise User model
def add_user_model
  # install Devise Gem
  generate 'devise:install'

  # Configure Devise
  environment "config.action_mailer.default_url_options = {
    host: 'localhost', port: 3000 }",
              env: 'development'

  route "root to: 'home#index'"

  # Create User model
  generate :devise, 'User', 'user_name'
end

# Main Action block
add_gems

after_bundle do
  install_rspec
  configure_debugger
  if yes?('Would you like to add a user model with Devise?', :blue)
    add_user_model
  end

  # Run initial migration
  rails_command 'db:create'
  rails_command 'db:migrate'

  # Git initialization
  git :init
  git add: '.'
  git commit: %( -m "Initial Commit")

  say "Project created, Don't forget to create a new repo on GitHub!", :green

  run 'open https://github.com/new'
end
