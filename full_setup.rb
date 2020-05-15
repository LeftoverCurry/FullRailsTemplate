# frozen_string_literal: true

# Builds gemfile with basic debugging, rspec, Factorybot
def add_gems
  gem 'devise'
  gem 'factory_bot'

  gem_group :development, :test do
    gem 'pry'
    gem 'rspec-rails'
    gem 'debase'
    gem 'ruby-debug-ide'
    gem 'faker'
  end
end

# Configure debugger
def configure_debugger
  run 'mkdir ./.vscode'
  # create_file './.vscode/launch.json'
  copy_file '~/railsprojects/full_setup_template/launch_template.json', './.vscode/launch.json'
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
  generate :devise, 'User', 'user_name', 'email'
end

add_gems
