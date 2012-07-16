require 'spec_helper'
module SendgridEvents
  module Handlers
    describe Base do
      subject { Base }
      it { should respond_to(:handle) }
      it { should_not respond_to(:handlee) }
      let(:event) { {
        :email => "foo@bar.com",
        :timestamp => 1322000095,
        :sendgrid_events_id => '7',
        :event => "delivered"
      } }
    end
  end
end
