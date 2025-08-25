# config/initializers/rswag_csp.rb
module Rswag
  module Ui
    class Middleware
      # Alias the original call method
      alias_method :original_call, :call

      def call(env)
        status, headers, body = original_call(env)

        # Define your custom CSP header
        csp_header = "sandbox allow-same-origin allow-scripts"

        # Add or override the Content-Security-Policy header
        headers['Content-Security-Policy'] = csp_header

        [status, headers, body]
      end
    end
  end
end
