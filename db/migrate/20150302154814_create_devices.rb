class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
    	t.string :name
    	t.string :short_name
    	t.string :description
    	t.integer :room_id

    	t.timestamps
    end
  end
end
