require 'rails/generators'
module SengridEvents
  module Generators
    class InstallGenerator < Rails::Generators::Base
      namespace "sendgrid_events"
      source_root File.expand_path "../templates", __FILE__
      include Rails::Generators::ResourceHelpers

      class_option :migrations, :desc => "Generate migrations", :type => :boolean, :default => true
      def install_migrations
        puts "Copying Sengrid Events migrations..."
        `rake sendgrid_events:install:migrations`
      end

      class_option :initializers, :desc => "Generate initializers", :type => :boolean, :default => true
      def install_initializer
        puts "Copying initializer..."
        copy_file "initializer.rb", "config/initializers/sendgrid_events.rb"
      end

      class_option :routes, :desc => "Generate routes", :type => :boolean, :default => true
      def add_routes
        routes = "mount SendgridEvents::Engine => '/sendgrid_events'"
        route routes
      end
    end
  end
end
