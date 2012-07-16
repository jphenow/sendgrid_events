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

      def install_migrations
        puts "Copying Sengrid Events migrations..."
        migration_template "sendgrid_events_table.rb", "db/migrate/sendgrid_events_table.rb"
      end

      def install_initializer
        puts "Copying initializer..."
        copy_file "initializer.rb", "config/initializers/sendgrid_events.rb"
      end

      def add_routes
        insert_into_file Rails.root.join('config', 'routes.rb'),
          File.open(File.join(File.expand_path("../install/templates", __FILE__), 'routes.rb')).read,
          :after => /Application\.routes\.draw do$/
      end
    end
  end
end
