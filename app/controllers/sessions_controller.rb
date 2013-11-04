class SessionsController < ApplicationController
  def new
  end

  def create
  	user = login(params[:email], params[:password], params[:remember_me])

    if user
    	@current_user = user
      redirect_back_or_to root_url, :notice => "Login ok!"
    else
      flash.now.alert = "Email ou senha invalido(s)."
      render :new
    end
  end

	def destroy
  		logout
  		redirect_to root_url, :notice => "Logout ok!"
	end
end
