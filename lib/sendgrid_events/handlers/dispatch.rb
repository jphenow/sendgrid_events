module SendgridEvents
  module Handlers
    class Dispatch
      class << self
        attr_accessor :registered_handlers, :selected_handlers
      end

      def self.registered_handlers
        @registered_handlers.present? ? @registered_handlers.with_indifferent_access : {}
      end

      def self.acceptable_handlers
        @acceptable_handlers ||= begin
                                   array = %w[processed
                                              deferred
                                              delivered
                                              open
                                              click
                                              bounce
                                              dropped
                                              spamreport
                                              unsubscribe
                                            ]
                                   Hash[array.zip([true] * array.size)].with_indifferent_access
                                 end
      end

      def self.selected_handlers=(handler_list)
        raise ArgumentError, "Found an unaccetable handler" unless handler_list.all? { |x| acceptable_handlers[x.to_sym] }
        @selected_handlers = Hash[handler_list.zip([true] * handler_list.size)].with_indifferent_access
      end
    end
  end
end
