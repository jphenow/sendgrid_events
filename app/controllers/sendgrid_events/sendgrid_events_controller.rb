module SendgridEvents
  class SendgridEventsController < ActionController::Base
    def receiver
      Receiver.receive params
      render :nothing => true
    end
  end
end
