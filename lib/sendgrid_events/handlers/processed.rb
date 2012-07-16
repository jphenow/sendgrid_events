module SendgridEvents
  module Handlers
    class Processed < Base
      register_as_handler_for :processed
    end
  end
end
