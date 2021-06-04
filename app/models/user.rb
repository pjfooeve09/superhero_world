class User < ApplicationRecord
    has_many :superheroes
    has_many :teams, through: :superheroes

    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
    validates :password, length: {minimum: 5}
    has_secure_password


    def self.g_random_code(number)
        array = Array('A'..'Z') + Array('a'..'z')
        Array.new(number) { array.sample }.join
    end      

    def self.from_omniauth(auth)
        # Creates a new user only if it doesn't exist
        where(email: auth.info.email).first_or_initialize do |user|
            user.email = auth.info.email
            user.username = auth.info.name + rand(1..1000).to_s
            user.name = auth.info.name
            password = self.g_random_code(19)
            user.password = password
        end
    end

    def teams_attributes=(team_attributes)
        team_attributes.values.each do |team_attribute|
          team = Team.find_or_create_by(team_attribute)
          self.teams << team
        end
    end

    
end
