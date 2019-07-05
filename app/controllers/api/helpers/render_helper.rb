module API::Helpers::RenderHelper
  def success!
    Rails.logger.info "[api-complete] Requested: #{simple_log_data}"
    {
      code:   201,
      status: 'success'
    }
  end

  def simple_log_data
    {
      method: env['REQUEST_METHOD'],
      path:   env['PATH_INFO'],
      ip:     env['REMOTE_ADDR']
    }.to_s.encode('UTF-8', invalid: :replace, undef: :replace, replace: '?')
  end

  def error_422!(msg)
    throw_error!(422, 'UnprocessableEntityError', msg)
  end

  def throw_error!(code, status, msg)
    default_object = { code: code, status: status }
    Rails.logger.info "[api-complete] Requested Error: #{simple_log_data} | Errors: #{msg}"
    error!(default_object.merge(error: msg), code)
  end
end
