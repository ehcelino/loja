class SessionsController < ApplicationController
  def new
  end

def create
  user = User.find_by(username: params[:username])
  if user && user.authenticate(params[:password])
    if params[:remember_me]
      cookies.permanent[:auth_token] = user.auth_token
    else
      cookies[:auth_token] = user.auth_token
    end
    flash[:success] = "Sessão iniciada com sucesso."
    redirect_to root_url
  else
    flash[:danger] = "Usuário ou senha inválidos."
    render "new"
  end
end

def destroy
  cookies.delete(:auth_token)
  session[:cart_id] = nil
  flash[:success] = "Sessão encerrada com sucesso."
  redirect_to root_url
end

end
