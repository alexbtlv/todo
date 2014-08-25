class Todo < ActiveRecord::Base
	belongs_to :user
	#validates :name, presence: true, length: { minimum: 2 }

	def toggle_completion!
		update_attribute(:completed, true)
	end

	def undo_completion!
		update_attribute(:completed, false)
	end
end
