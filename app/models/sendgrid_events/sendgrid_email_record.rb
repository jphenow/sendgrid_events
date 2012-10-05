module SendgridEvents
  class SendgridEmailRecord < ActiveRecord::Base
    #belongs_to :sender, :polymorphic => true # What models can we use here?
    # Message
    include EnumeratedField
    enum_field :status, [
      %w[bounced bounced],
      %w[clicked clicked],
      %w[deferred deferred],
      %w[delivered delivered],
      %w[dropped dropped],
      %w[opened opened],
      %w[processed processed],
      %w[processing processing],
      %w[spamreported spamreported],
      %w[unsubscribed unsubscribed],
    ]

    def self.create_from_headers!(headers, additional_attributes)
      create!(:to      => headers[:to],
              :from    => headers[:from],
              :subject => headers[:subject],
              :status  => 'processing')
    end
  end
end
