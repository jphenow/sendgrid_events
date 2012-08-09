require 'spec_helper'

class TestMailer < ActionMailer::Base
  def test_mail
    mail(to: "to@example.com", from: "from@example.com", subject: "Test Mail")
  end
end

module SendgridEvents
  describe ActionMailerOverride do
    before { @mail = TestMailer.test_mail }
    let(:recorded_email) { SendgridEvents::SendgridEmailRecord.last }


    describe "records the sent email" do
      specify { recorded_email.to.should      == "to@example.com"   }
      specify { recorded_email.from.should    == "from@example.com" }
      specify { recorded_email.subject.should == "Test Mail"        }
      specify { recorded_email.status.should  == 'processing'       }
    end

    it "stores new event record's id in the uniq args" do
      sendgrid_header = @mail.instance_variable_get(:@sendgrid_header)
      sendgrid_header.data[:unique_args].should == {sendgrid_events_id: recorded_email.id}
    end
  end
end
