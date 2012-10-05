require 'spec_helper'

class TestMailer < ActionMailer::Base
  def test_mail
    sendgrid_email_record_attributes user_id: 42
    mail(to: "to@example.com", from: "from@example.com", subject: "Test Mail")
  end
end

module SendgridEvents
  describe ActionMailerOverride do
    let(:recorded_email) { SendgridEvents::SendgridEmailRecord.last }


    describe "records the sent email" do
      before { @mail = TestMailer.test_mail }
      specify { recorded_email.to.should      == "to@example.com"   }
      specify { recorded_email.from.should    == "from@example.com" }
      specify { recorded_email.subject.should == "Test Mail"        }
      specify { recorded_email.status.should  == 'processing'       }
    end

    describe "stores new event record's id in the uniq args" do
      before                { @mail = TestMailer.test_mail }
      let(:sendgrid_header) { @mail.instance_variable_get(:@sendgrid_header) }

      specify { sendgrid_header.data[:unique_args].should == { sendgrid_events_id: recorded_email.id} }
    end

    describe "passes additional attributes to SendgridEmailRecord" do
      let(:email_record) { stub.as_null_object }

      specify do
        SendgridEmailRecord.should_receive(:create_from_headers!).with do |_, additional_attributes|
          additional_attributes.should == { user_id: 42 }
        end.and_return(email_record)

        TestMailer.test_mail
      end
    end
  end
end
