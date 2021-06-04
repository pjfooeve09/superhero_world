class CreateSuperheroes < ActiveRecord::Migration[6.1]
  def change
    create_table :superheroes do |t|
      t.string :name
      t.string :user_id
      t.timestamps 
    end
  end
end
