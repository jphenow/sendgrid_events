module SendgridEvents
  module ActionMailerOverride
    extend ActiveSupport::Concern
    included do
      alias_method_chain :uniq_args, :merge_args
      alias_method_chain :mail, :record_email
    end

    attr_accessor :sendgrid_email_record_attributes
    def sendgrid_email_record_attributes(attrs = nil)
      @sendgrid_email_record_attributes ||= {}
      return @sendgrid_email_record_attributes if attrs.nil?
      self.sendgrid_email_record_attributes = attrs
    end

    def uniq_args_with_merge_args(args)
      set_args = send_grid_header.data[:unique_args] ||= {}
      uniq_args_without_merge_args set_args.merge(args)
    end

    def mail_with_record_email(headers={}, &block)
      id = SendgridEmailRecord.create_from_headers!(headers, sendgrid_email_record_attributes).id
      uniq_args :sendgrid_events_id => id
      mail_without_record_email headers, &block
    end
  end
end
ActionMailer::Base.send :include, SendgridEvents::ActionMailerOverride
