class Superhero < ApplicationRecord
    belongs_to :user
    has_many :superhero_teams
    has_many :teams, through: :superhero_teams
    has_many :superpowers

    validates_presence_of  [:name, :teams, :superpowers]

    accepts_nested_attributes_for :teams, reject_if: :all_blank
    accepts_nested_attributes_for :superpowers, reject_if: :all_blank

   # def teams_attributes=(team_attributes)
    #    team_attributes.values.each do |team_attribute|
     #     team = Team.find_or_create_by(team_attribute)
      #    self.teams << team
      #  end
  # end
    
end

