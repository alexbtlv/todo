class CreateUserRoles < ActiveRecord::Migration
  def change
    create_table :user_roles, id: false do |t|
    	t.string :user_id
    	t.string :role_id
      t.timestamps
    end
  end
end
