module SendgridEvents
  module Handlers
    class Bounced < Base
      register_as_handler_for :bounce
    end
  end
end
