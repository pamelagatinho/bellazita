# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Bellazita::Application.initialize!

Time::DATE_FORMATS[:data_br] = "%d/%m/%Y"

