module SendgridEvents
  class Receiver
    def self.receive(params)
      if Configure.receive? and params['_json'] and params['_json'].is_a? Array
        params['_json'].each do |event|
          if event.is_a? Hash and event.has_key? "sendgrid_events_id"
            event = event.with_indifferent_access
            Handlers::Base.choose_and_handle(event)
          end
        end
      end
    end
  end
end
