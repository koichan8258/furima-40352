class ApplicationController < ActionController::Base

  before_action :except [:index]
  before_action :configure_permitted_parameters, if: :devise_controller?


  private



  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up, keys: [:nickname, :birth, :first_name, :last_name, :first_name_furigana, :last_name_furigana]
    )
  end

end
