class Todo < ActiveRecord::Base

	def toggle_completion!
		update_attribute(:comleted, true)
	end
end
