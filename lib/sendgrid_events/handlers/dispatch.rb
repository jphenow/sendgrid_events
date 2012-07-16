module SendgridEvents
  module Handlers
    class Dispatch
      class << self
        attr_accessor :registered_handlers
      end

      def self.registered_handlers
        @registered_handlers ||= {}
      end
    end
  end
end
