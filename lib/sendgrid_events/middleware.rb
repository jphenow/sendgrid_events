require 'action_dispatch/http/request'
module SendgridEvents
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      if env["REQUEST_URI"].include? Configure.mount_at
        clean_sendgrid_params env
      end
      @app.call(env)
    end

    private
    def clean_sendgrid_params(env)
       request = Request.new(env)
       raise request.body.rewind.read
    end
  end
end
