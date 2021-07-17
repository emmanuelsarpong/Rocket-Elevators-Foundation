class ApplicationController < ActionController::Base
	def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:signup, keys: [:name, :phone])
    devise_parameter_sanitizer.permit(:account_updates, keys: [:name, :phone])
  end

  # module Devise
  #   alias :devise_current_user :current_user
  # end

  # module ZendeskAPI
  #   # ::Data::DataResource::Resource::User
  #   alias :zen_current_user :current_user
  #   remove_method :current_user
  #   #alias_method :zen_current_user, :current_user
  #   #alias_attribute :zen_current_user, :current_user
  # end

  # def devise_current_user
  #   @devise_current_user ||= warden.authenticate(scope: :user)
  # end
  #
  # def current_user
  #   if params[:user_id].blank?
  #     devise_current_user
  #   else
  #     User.find(params[:user_id])
  #   end
  # end

  # def devise_current_user
  #   @devise_current_user = @user
  # end
end
