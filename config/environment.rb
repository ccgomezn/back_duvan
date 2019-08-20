# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.routes.default_url_options[:host] = '<%= ENV["host"] %>'

Rails.application.initialize!
