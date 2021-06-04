class SessionsController < ApplicationController

    def new
        new_user_or_go_to_user_path  
    end

    def create
        @user = User.find_by(username: params[:username])     
        if @user && @user.authenticate(params[:password])
			log_in(@user)
            redirect_to @user
        else
            flash[:notice] = "Incorrect Username or Password"
			redirect_to login_path
		end
	end

    def destroy
        session.clear
        redirect_to login_path
	end

	def facebookAuth
        # Get access tokens from the google server
        access_token = request.env["omniauth.auth"]
        @user = User.from_omniauth(access_token)
        # Access_token is used to authenticate request made from the rails application to the google server
        @user.facebook_token = access_token.credentials.token
        # Refresh_token to request new access_token
        # Note: Refresh_token is only sent once during the first request
        refresh_token = access_token.credentials.refresh_token
        @user.facebook_refresh_token = refresh_token if refresh_token.present?
       
        if @user.save
			log_in(@user)
            redirect_to user_path(@user)
        else
            redirect_to login_path
		end
    end

    
end