require 'spec_helper'
module SendgridEvents
  module Handlers
    describe Base do
      subject { Base }
      it { should respond_to(:handle) }
      it { should_not respond_to(:handlee) }
      it { should respond_to(:registered_handlers) }
      it { should respond_to(:selected_handlers) }
      it { should respond_to(:choose_and_handle) }
      it { should respond_to(:register_as_handler_for) }
      let(:event) { {
        :email => "foo@bar.com",
        :timestamp => 1322000095,
        :sendgrid_events_id => '7',
        :event => "delivered"
      } }

      it "returns the list of handlers" do
        subject.registered_handlers.symbolize_keys.keys.sort.should == Dispatch.acceptable_handlers.keys.sort
      end

      it "chose a handler if handler is registered" do
        subject.stub(:selected_handlers).and_return({ "delivered" => true })
        Delivered.should_receive(:handle).with(event)
        subject.choose_and_handle(event)
      end

      it "doesn't handle a non-selected handler" do
        subject.stub(:selected_handlers).and_return({})
        Delivered.should_not_receive(:handle).with(event)
        subject.choose_and_handle(event)
      end

      it "doesn't handle a non-registered handler" do
        subject.stub(:selected_handlers).and_return({ "delivered" => true })
        subject.stub(:registered_handlers).and_return({})
        Delivered.should_not_receive(:handle).with(event)
        subject.choose_and_handle(event)
      end

      it "doesn't regitser a new handle with unacceptable handle" do
        expect { subject.register_as_handler_for(:winning) }.to raise_error(ArgumentError)
      end
    end
  end
end
