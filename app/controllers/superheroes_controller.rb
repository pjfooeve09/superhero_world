class SuperheroesController < ApplicationController

    before_action :redirect_if_not_logged_in

    def index     
        @superheroes = current_user.superheroes 
        #binding.pry 
    end

    def show
        @superhero = Superhero.find(params[:id])    
    end

    def new
        @superhero = Superhero.new      
    end

    def create
        @superhero = Superhero.new(superhero_params.merge(user_id: current_user.id))  
        if @superhero.save     
            redirect_to user_superheroes_path(current_user)
        else   
            render :new 
        end
    end

    def edit
        @superhero = Superhero.find(params[:id])            
    end

    def update
        @superhero = Superhero.find(params[:id])
        if @superhero.update(superhero_params)
            redirect_to user_superheroes_path(current_user)
        else
            render :edit
        end
    end 

    def destroy
        @superhero = Superhero.find(params[:id])
        @superhero.delete
        redirect_to user_superheroes_path(current_user)    
    end

    private

    def superhero_params
        params.require(:superhero).permit(:id, :name, :user_id, team_ids:[], teams_attributes: [:id, :name], superpowers_attributes: [:id, :name]) #need to use :id, so the fields in form do no duplicate/add new one instead of update existing
    end

end