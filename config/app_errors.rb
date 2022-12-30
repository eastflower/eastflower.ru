# begin
#   raise AppError::Error500
# rescue => e
#   e.message
#   e.status_code
# end

module AppError; end

{
  400 => 'Bad Request',
  401 => 'Unauthorized',
  402 => 'Payment Required',
  403 => 'Forbidden',
  404 => 'Not Found',
  405 => 'Method Not Allowed',
  406 => 'Not Acceptable',
  422 => 'Unprocessable Entity',

  500 => 'Internal Server Error',
  501 => 'Not Implemented',
  502 => 'Bad Gateway',
  503 => 'Service Unavailable'
}.each do |status_code, message|
  AppError.class_eval <<-CODE
    class Error#{status_code} < StandardError
      def message
        "#{message}"
      end

      def status_code
        #{status_code}
      end
    end
  CODE
end