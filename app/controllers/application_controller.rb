class ApplicationController < ActionController::API

  def authorize!
    valid, result = verify(raw_token(request.headers))

    render json: { message: result }.to_json, status: :unauthorized unless valid

    @token ||= result

  end

  def can_read_admin_messages!
    check_permissions(@token, 'read:admin-messages')
  end
  
  def check_permissions(token, permission)
    permissions = token['scope'] || []
    permissions = permissions.split if permissions.is_a? String

    unless permissions.include?(permission)
      render json: { message: 'Access is denied' }.to_json,
             status: :unauthorized
    end
  end

  private

  def verify(token)
    payload, = ::JsonWebToken.verify(token)
    [true, payload]
  rescue ::JWT::DecodeError => e
    [false, e]
  end

  def raw_token(headers)
    return headers['Authorization'].split.last if headers['Authorization'].present?

    nil
  end
  
end
