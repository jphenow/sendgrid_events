module SendgridEvents
  module Handlers
    class Dropped < Base
      register_as_handler_for :dropped
    end
  end
end
