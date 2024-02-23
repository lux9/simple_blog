class CustomRegistrationsController < Devise::RegistrationsController
  def new
    # Store post_id in the session if it's present in the params
    session[:post_id] = params[:post_id] if params[:post_id].present?
    super
  end
end