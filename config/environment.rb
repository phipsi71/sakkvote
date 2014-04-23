# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Sakkvote::Application.initialize!

Rails.logger = Logger.new('sakkvote.log')
Rails.logger.level = 0

