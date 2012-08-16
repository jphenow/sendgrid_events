module SendgridEvents
  class SendgridEmailRecord < ActiveRecord::Base
    #belongs_to :sender, :polymorphic => true # What models can we use here?
    # Message
    include EnumeratedField
    enum_field :status, [
      %w[processing processing],
      %w[dropped dropped],
      %w[deferred deferred],
      %w[bounced bounced],
      %w[delivered delivered]
    ]

    def self.create_from_headers!(headers, additional_attributes)
      create!(:to      => headers[:to],
              :from    => headers[:from],
              :subject => headers[:subject],
              :status  => 'processing')
    end
  end
end
