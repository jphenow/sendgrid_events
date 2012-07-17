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
       request = ActionDispatch::Request.new(env)
       request.body.rewind
       raise request.body.read.inspect
    end
  end
end
