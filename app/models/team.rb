class Team < ApplicationRecord
    has_many :superhero_teams
    has_many :superheroes, through: :superhero_teams

    #validates_uniqueness_of :name, message: ': the team name already exists; please select team from the checkboxes'  
    validates_presence_of :name

    def self.team_with_most_superheroes
        self.joins(:superheroes).group('superheroes.id').order("count(superheroes.id) DESC")
    end

end
