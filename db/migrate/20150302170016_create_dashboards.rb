class CreateDashboards < ActiveRecord::Migration
  def change
    create_table :dashboards do |t|
    	t.integer :user_id
    	t.integer :device_id
    	t.integer :room_id

    	t.timestamps
    end
  end
end
