module SendgridEvents
  module Handlers
    class Unsubscribed < Base
      register_as_handler_for :unsubscribe
    end
  end
end
