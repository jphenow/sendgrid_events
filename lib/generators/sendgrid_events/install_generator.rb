require 'rails/generators'
module SendgridEvents
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      source_root File.expand_path "../install/templates", __FILE__

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      def install
        migrations
        initializer
        routes
        middleware
      end

      private

      def migrations
        puts "Copying Sengrid Events migrations..."
        begin
          migration_template "sendgrid_events_table.rb", "db/migrate/sendgrid_events_table.rb"
        rescue
          puts "Already have that migration"
        end
      end

      def initializer
        puts "Copying initializer..."
        copy_file "initializer.rb", "config/initializers/sendgrid_events.rb"
      end

      def routes
        puts "Copying routes..."
        insert_into_file Rails.root.join('config', 'routes.rb'),
          File.open(File.join(File.expand_path("../install/templates", __FILE__), 'routes.rb')).read,
          :after => /Application\.routes\.draw do$/
      end

      def middleware
        puts "Copying config..."
        insert_into_file Rails.root.join('config', 'application.rb'), :after => /class Application.*$/ do
          "\n    config.middleware.insert_after ActiveRecord::ParamsParser, SendgridEvents::Middleware"
        end
      end
    end
  end
end
