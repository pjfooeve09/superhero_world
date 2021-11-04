class TeamsController < ApplicationController
    before_action :redirect_if_not_logged_in

    def show
        @team = Team.team_with_most_superheroes
        #binding.pry
    end

    def edit
        @team = Team.find(params[:id])       
    end

    def update
        @team = Team.find(params[:id])
        if @team.update(team_params)
            redirect_to user_superheroes_path(current_user)    
        else
            render :edit
        end
    end

    def destroy
        @team = Team.find(params[:id])
        @team.delete
        @team.superheroes.destroy_all
        
        redirect_to user_superheroes_path(current_user)
    end


    private

    def team_params
        params.require(:team).permit(:id, :name)
    end


end