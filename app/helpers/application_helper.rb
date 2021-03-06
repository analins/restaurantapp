module ApplicationHelper

  def current_admin
    if session[:admin_id]
      @current_admin = @current_admin || Admin.find(session[:admin_id])
    end
  end

  def authenticate!
    redirect_to root_path unless current_admin
  end

  # def current_user
  #   if session[:user_id]
  #     @current_user = @current_user || User.find(session[:user_id])
  #   end
  # end
  #
  # def authenticate!
  #   redirect_to root_path unless current_user
  # end
end
