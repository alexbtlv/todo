class RenameStatusColumnToCompleted < ActiveRecord::Migration
  def change
  	change_table :todos do |t|
  		t.rename :status, :completed
  	end
  end
end
