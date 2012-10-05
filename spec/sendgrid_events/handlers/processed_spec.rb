require 'spec_helper'
module SendgridEvents
  module Handlers
    describe Processed do
      subject { Processed }
      it { should respond_to(:handle) }
      its(:handlee) { should == 'processed' }
      let(:event) { {
        :email => "foo@bar.com",
        :timestamp => 1322000095,
        :sendgrid_events_id => '7',
        :event => "processed"
      } }

      it "updates event, but doesn't call handler without one set" do
        subject.should_receive(:find_and_update_event).with(event).once
        subject.should_receive(:handler).never
        subject.handle(event)
      end

      it "updates event, but doesn't call handler without one set" do
        subject.handler do
          true
        end
        subject.stub(:find_and_update_event => true)
        subject.should_receive(:handler).once
        subject.handle(event)
      end
    end
  end
end
