module SendgridEvents
  class Receiver
    def self.receive(params)
      if Configure.receive?
        params['_json'].each do |event|
          event = event.with_indifferent_access
          Handlers::Base.choose_and_handle(event) if event.has_key? "sendgrid_events_id"
        end
      end
    end
  end
end
