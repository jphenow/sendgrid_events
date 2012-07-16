module SendgridEvents
  class Configure
    def self.mount_at(val = nil)
      @mount_at ||= val
    end

    def self.config(&block)
      class_eval &block
    end

    def self.handle(list)
      Handlers::Dispatch.selected_handlers = list
    end

    def self.receive(boolean)
      @receive = boolean
    end

    def self.receive?
      @receive.nil? ? true : @receive
    end
  end
end
