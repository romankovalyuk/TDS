class Auth0Controller < ApplicationController
  def callback
     # example request.env['omniauth.auth'] in https://github.com/auth0/omniauth-auth0#auth-hash
    # id_token = session[:userinfo]['credentials']['id_token']
    # store the user profile in session and redirect to root
    auth = request.env['omniauth.auth']
    user = User.where(:provider => auth["provider"], :uid => auth["uid"])
               .first_or_initialize(
                  :refresh_token => auth["credentials"]["refresh_token"],
                  :access_token => auth["credentials"]["token"],
                  :expires => auth["credentials"]["expires_at"],
                  :name => auth["info"]["name"],
                  :email => auth["info"]["email"],
                  :image => auth["info"]["image"]
                )

  if user.save
    session[:user_id] = user.id 
    redirect_to dashboards_path
  else
    "Failed to login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end

  def failure
    @error_msg = request.params['message']
  end
end
