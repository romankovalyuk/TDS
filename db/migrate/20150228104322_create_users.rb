class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
       t.string :name
       t.string :email
       t.string :provider
       t.string :uid
       t.string :refresh_token
       t.string :access_token
       t.datetime :expires
       t.string :image
       
       t.timestamps
    end
  end
end
