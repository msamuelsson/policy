class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #Authentication with Devise
  before_filter :authenticate_user!, :set_locale
  
  #I18n. I18n.default_locale is set to "it"
  def set_locale
    I18n.locale = params[:locale]
    #I18n.locale = params[:locale] || I18n.default_locale
  end
  
  #def default_url_options(options = {})
    #{locale: I18n.locale}
  #end
  def self.default_url_options(options={})
    options.merge({ :locale =>  I18n.locale })
  end

end
