module SendgridEvents
  module ActionMailerOverride
    extend ActiveSupport::Concern
    included do
      alias_method_chain :sendgrid_unique_args, :merge_args
    end

    def sendgrid_unique_args_with_merge_args(args={})
      @sg_unique_args ||= {}
      @sg_unique_args.merge! args
    end

    def mail(headers={}, &block)
        id = SendgridEmailRecord.create!(:to => headers[:to],
                                         :from => headers[:from],
                                         :subject => headers[:subject],
                                         :status => 'processing').id
        sendgrid_unique_args :sendgrid_events_id => id
      super headers, &block
    end
  end
end
SendGrid.send :include, SendgridEvents::ActionMailerOverride
