class LoginsController < ApplicationController
  #skip_before_action :check_user_login

  def new
  end
  #layout :false

  def create
    if params[:username] == 'admin' && params[:password] == '888$$$'
      session[:current_user] = 'admin'
      redirect_to blogs_path
      # 跳转到 首页
    else
      redirect_to new_login_path
      # 跳转到 登录页面
    end
  end
  #layout :false

  def logout
    session[:current_user] = nil
    redirect_to new_login_path
  end

end
