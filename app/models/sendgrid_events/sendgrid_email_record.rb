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
  end
end
