class ApplicationController < ActionController::Base
  include Pagy::Backend
  
  def after_sign_in_path_for(resource)
    post_id = session.delete(:post_id)
    post_id ? post_path(post_id) : super
  end
end