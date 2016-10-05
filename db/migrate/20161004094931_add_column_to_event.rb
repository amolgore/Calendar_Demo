class AddColumnToEvent < ActiveRecord::Migration
  def change
  	add_column :events, :to_do, :boolean, :default => false
  end
end
