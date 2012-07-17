module SendgridEvents
  class Receiver
    def self.receive(params)
      if Configure.receive?
        params.each do |event|
          Handlers::Base.choose_and_handle(event) if event.has_key? "sendgrid_events_id"
        end
      end
    end
  end
end
