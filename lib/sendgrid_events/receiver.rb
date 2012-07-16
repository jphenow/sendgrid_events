module SendgridEvents
  class Receiver
    def self.receive(params)
      extract_events_and_clean(params).each do |event|
        Handlers::Base.choose_and_handle event
      end
    end

    private
    def self.extract_events_and_clean(params)
      params.first.first.split("\n").collect do |json_hash|
        JSON.parse(json_hash).symbolize_keys
      end
    end
  end
end
