class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all

    auth = request.env['omniauth.auth']

    # if the user is already signed in, then we must be adding
    # another authentication method.
    if user_signed_in?
      user = current_user
      user.add_authentication(auth.provider, auth.uid)
    else
      # Otherwise, use our railscast code to create a new user
      # and authentication at the same time.
      user = User.from_omniauth(request.env['omniauth.auth'])
    end

    if user
      sign_in_and_redirect user
    else
      # Probably should clean this up some.  Actually since this contains
      # your keys, you definately need to get rid of this before going live.
      raise request.env['omniauth.auth'].to_yaml
    end
    

  end

  alias_method :twitter, :all
end
