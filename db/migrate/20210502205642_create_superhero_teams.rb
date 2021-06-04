class CreateSuperheroTeams < ActiveRecord::Migration[6.1]
    def change
      create_table :superhero_teams do |t|
        #t.belongs_to :superhero, index: true, foreign_key: true
        #t.belongs_to :team, index: true, foreign_key: true
        t.integer :superhero_id
        t.integer :team_id
        t.timestamps null: false
      end
    end
  end
  