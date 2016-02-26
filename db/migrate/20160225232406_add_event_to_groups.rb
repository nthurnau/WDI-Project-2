class AddEventToGroups < ActiveRecord::Migration
  def change
    add_column :groups, :event_name, :string
    add_column :groups, :event_date, :date
    add_column :groups, :event_time, :time
    add_column :groups, :event_location, :string
  end
end
