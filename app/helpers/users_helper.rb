
module UsersHelper

  def authorized_to_edit(input)
    input.user_id == session[:user_id]
  end
end