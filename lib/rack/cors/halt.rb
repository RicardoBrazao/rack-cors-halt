require 'json'

module Rack
  class Cors
    class Halt

      def initialize(app)
        @app = app
      end

      def call(env)
        if(env['X_RACK_CORS'].hit || !http_origin_header_present?(env))
          @app.call(env)
        else
          not_valid_reason = {
            hit: env['X_RACK_CORS'].hit,
            miss_reason: env['X_RACK_CORS'].miss_reason,
            preflight: env['X_RACK_CORS'].preflight
          }
          [200, {"Content-Type" => "application/json"}, [not_valid_reason.to_json]]
        end
      end

      private

      def http_origin_header_present?(env)
        env['HTTP_ORIGIN'].to_s != ''
      end
    end
  end
end