class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all

    u = User.from_omniauth(request.env['omniauth.auth'])
    
    if u
      sign_in u
    else
      raise request.env['omniauth.auth'].to_yaml

    end
    # Here you should find authentication object that matcehs the omniauth.auth
    # details and then return that user.  This won't work with additional
    # authentication methods though... you'll have to figure that out. 
    

  end

  alias_method :twitter, :all
end
