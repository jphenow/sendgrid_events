module SendgridEvents
  module Handlers
    class SpamReported < Base
      register_as_handler_for :spamreport
    end
  end
end
