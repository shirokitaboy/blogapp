class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      # ログイン成功した場合
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      # ログイン失敗した場合
      flash.now[:danger] = 'ログインしてください'
      render 'new'
    end
  end
end
