class UsersController < ApplicationController
    
    def new     
        new_user_or_go_to_user_path 
    end

    def create
        @user = User.new(user_params)
        if @user.save
          log_in(@user)  
          redirect_to @user 
        else
          render :new, layout: false
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])   
    end

    private

    def user_params
        params.require(:user).permit(:username, :name, :email, :password)
    end

end