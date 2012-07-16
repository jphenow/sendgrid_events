require 'sendgrid_events/handlers/dispatch'
require 'sendgrid_events/handlers/base'
Dir.glob(File.expand_path('../handlers/**/*.rb', __FILE__)).each { |file| require file }
