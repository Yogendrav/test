# Load the rails application
require File.expand_path('../application', __FILE__)

=begin
my_date_formats = { :default => '%d/%m/%Y' }
Time::DATE_FORMATS.merge!(my_date_formats)
Date::DATE_FORMATS.merge!(my_date_formats)
=end

# Initialize the rails application
Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8
Puzzle::Application.initialize!