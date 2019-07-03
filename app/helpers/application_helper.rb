module ApplicationHelper
  def body_controller
    params[:controller].split('/')[0]
  end
end
