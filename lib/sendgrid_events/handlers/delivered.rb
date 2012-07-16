module SendgridEvents
  module Handlers
    class Delivered < Base
      # Delivered
      # event     | email             | response              | category
      # delivered | Message recipient | Full reponse from MTA | The category you assigned
      register_as_handler_for :delivered
    end
  end
end
