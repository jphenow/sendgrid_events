module SendgridEvents
  module ActionMailerOverride
    extend ActiveSupport::Concern
    included do
      alias_method_chain :uniq_args, :merge_args
      alias_method_chain :mail, :record_email
    end

    def uniq_args_with_merge_args(args)
      set_args = send_grid_header.data[:unique_args] ||= {}
      uniq_args_without_merge_args set_args.merge(args)
    end

    def mail_with_record_email(headers={}, &block)
      id = SendgridEmailRecord.create!(:to => headers[:to],
                                       :from => headers[:from],
                                       :subject => headers[:subject],
                                       :status => 'processing').id
      uniq_args :sendgrid_events_id => id
      mail_without_record_email headers, &block
    end
  end
end
ActionMailer::Base.send :include, SendgridEvents::ActionMailerOverride
