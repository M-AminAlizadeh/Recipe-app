class UsersController < ApplicationController
  def sign_out_user
    sign_out(current_user)
    redirect_to new_user_session_path, notice: 'Signed out successfully'
  end
end
