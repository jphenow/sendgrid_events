require 'rails/generators'
module SendgridEvents
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path "../install/templates", __FILE__

      def install_migrations
        puts "Copying Sengrid Events migrations..."
        `rake sendgrid_events:install:migrations`
      end

      def install_initializer
        puts "Copying initializer..."
        copy_file "initializer.rb", "config/initializers/sendgrid_events.rb"
      end

      def add_routes
        routes = "mount SendgridEvents::Engine => '/sendgrid_events'"
        route routes
      end
    end
  end
end
