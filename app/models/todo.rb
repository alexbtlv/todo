class Todo < ActiveRecord::Base
	belongs_to :user

	def toggle_completion!
		update_attribute(:completed, true)
	end

	def undo_completion!
		update_attribute(:completed, false)
	end
end
