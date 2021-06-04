class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
    	t.string :username
    	t.string :name
    	t.string :email
		t.string :password_digest
		t.timestamps
    	t.string :facebook_token
		t.string :facebook_refresh_token
    end
  end
end