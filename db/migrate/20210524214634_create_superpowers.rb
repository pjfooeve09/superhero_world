class CreateSuperpowers < ActiveRecord::Migration[6.1]
  def change
    create_table :superpowers do |t|
      t.string :name
      t.string :superhero_id
      t.timestamps
    end
  end
end
