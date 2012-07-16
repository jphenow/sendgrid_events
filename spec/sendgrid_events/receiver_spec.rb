require 'spec_helper'
module SendgridEvents
  describe Receiver do
    subject { Receiver }
    it { should respond_to(:receive) }
    it { should respond_to(:extract_events_and_clean) }

    let(:params) {
      {"{\"email\":\"foo@bar.com\",\"timestamp\":1322000095,\"sendgrid_events_id\":\"7\",\"event\":\"delivered\"}\n{\"email\":\"foo@bar.com\",\"timestamp\":1322000096,\"sendgrid_events_id\":\"4\",\"event\":\"delivered\"}" => nil}
    }

    it "sends the poorly composed params to be cleaned then handles" do
      Handlers::Base.should_receive(:choose_and_handle).exactly(2).times
      subject.receive params
    end

    it "extracts JSON objects" do
      subject.extract_events_and_clean(params).should == [{
        :email => "foo@bar.com",
        :timestamp => 1322000095,
        :sendgrid_events_id => '7',
        :event => "delivered"
      },
      {
        :email => "foo@bar.com",
        :timestamp => 1322000096,
        :sendgrid_events_id => "4",
        :event => "delivered"
      }]
    end
  end
end
