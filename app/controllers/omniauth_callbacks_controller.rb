class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all

    user = User.from_omniauth(request.env['omniauth.auth'])
    
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
