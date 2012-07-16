module SendgridEvents
  module Handlers
    class Opened < Base
      register_as_handler_for :open
    end
  end
end
