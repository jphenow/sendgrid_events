module SendgridEvents
  class SendgridEventsController < ApplicationController
    def receiver
      Receiver.receive params
      render :nothing => true
    end
  end
end
