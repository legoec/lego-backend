module RequestLoginMacros
  def login_as(user)
    post(
      user_session_path,
      params: {
      email: user.email,
      password: user.password
      }
    )
  end

  def post_with_headers(path, parameters = {})
    post(path, parameters, headers: response_headers)
  end

  def get_with_headers(path)
    get(path, headers: response_headers)
  end

  def put_with_headers(path, parameters = {})
    put(path, parameters, headers: response_headers)
  end

  private

  def response_headers
    response.headers.slice(
      "access-token",
      "token-type",
      "client",
      "expiry",
      "uid"
    )
  end
end
