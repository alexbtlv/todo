class Todo < ActiveRecord::Base
	belongs_to :user

	def toggle_completion!
		update_attribute(:comleted, true)
	end
end
