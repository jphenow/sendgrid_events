module SendgridEvents
  module Handlers
    class Base
      def self.registered_handlers
        Dispatch.registered_handlers
      end

      def self.choose_and_handle(event)
        if registered_handlers.has_key? event[:event]
          registered_handlers[event[:event]].handle(event)
        else
          puts "Don't have a handler for #{event[:event]}"
        end
      end

      def self.register_as_handler_for(handlee)
        handlee = handlee.to_s
        registered_handlers[handlee] = self.name.constantize
        self.name.constantize.send :define_singleton_method, :handlee do
          handlee
        end
      end

      def self.handler(&block)
        @handler ||= block
      end

      def self.handle(event)
        found_event = find_and_update_event(event)
        handler.call(found_event) unless found_event.nil? or handler.nil?
      end

      def self.find_and_update_event(event)
        SendgridEmailRecord.find_by_id(event[:sendgrid_events_id]).tap do |record|
          record.update_attributes(:status => handlee) unless record.nil?
        end
      end
    end
  end
end
