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
    redirect_to root_url, :notice => "Sessão iniciada com sucesso."
  else
    flash[:danger] = "Usuário ou senha inválidos."
    render "new"
  end
end

def destroy
  cookies.delete(:auth_token)
  session[:cart_id] = nil
  redirect_to root_url, :notice => "Sessão encerrada com sucesso."
end

end
