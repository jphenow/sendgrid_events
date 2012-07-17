require 'spec_helper'
module SendgridEvents
  describe Receiver do
    subject { Receiver }
    it { should respond_to(:receive) }

    let(:params) {
      { "_json" => [
        {"email" => "foo@bar.com", "timestamp" => 1322000095,"sendgrid_events_id" => "7", "event" => "delivered"},
        {"email" => "foo@bar.com", "timestamp" => 1322000096, "sendgrid_events_id" => "4", "event" => "delivered"}
      ] }
    }

    it "sends the poorly composed params to be cleaned then handles" do
      Handlers::Base.should_receive(:choose_and_handle).exactly(2).times
      subject.receive params
    end
  end
end
