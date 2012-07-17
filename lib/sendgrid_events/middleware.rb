module SendgridEvents
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["REQUEST_URI"].include? Configure.mount_at
        query = env["QUERY_STRING"]
        clean_sendgrid_params query
      end
      @app.call(env)
    end

    private
    def clean_sendgrid_params(query)
      raise query
    end
  end
end
