module SendgridEvents
  module Handlers
    class Clicked < Base
      register_as_handler_for :click
    end
  end
end
