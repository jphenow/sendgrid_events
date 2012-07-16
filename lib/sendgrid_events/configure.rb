module SendgridEvents
  class Configure
    def self.config(&block)
      class_eval &block
    end

    def self.handle(list)
      Handlers::Dispatch.selected_handlers = list
    end
  end
end
