module ::SendgridEvents
  class Engine < Rails::Engine
    config.mount_at = '/sendgrid_events/' #TODO Config file
    class << self
      attr_accessor :root
    end

    def self.root
      @root ||= Pathname.new(File.expand_path('../../', __FILE__))
    end
  end
end
