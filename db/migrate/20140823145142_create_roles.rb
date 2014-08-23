class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
    	t.string :admin
      t.timestamps
    end
  end
end
