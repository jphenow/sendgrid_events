module SendgridEvents
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      scrub(env) if env and env["REQUEST_URI"] and env["REQUEST_URI"].include? Configure.mount_at
      @app.call(env)
    end

    private
    def scrub(env)
      rack_input = env["rack.input"].read
      rack_input ="[#{rack_input.split("\r\n").join(",")}]"
      env["rack.input"] = StringIO.new(rack_input)
    rescue
    ensure
      env["rack.input"].rewind
    end
  end
end
