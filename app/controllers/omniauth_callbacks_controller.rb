class OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def all
    raise request.env['omniauth.auth'].to_yaml

    # Here you should find authentication object that matcehs the omniauth.auth
    # details and then return that user.  This won't work with additional
    # authentication methods though... you'll have to figure that out. 
  end

  alias_method :twitter, :all
end
