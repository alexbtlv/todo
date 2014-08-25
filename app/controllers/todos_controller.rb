class TodosController < ApplicationController
	before_action :set_todo, only: [:edit, :update, :destroy, :complete, :undo]
	before_filter :authenticate_user!
	
	def index
		@todos = Todo.where(completed: false).all
		@dones = Todo.where(completed: true).all
	end

	def new
		@todo = current_user.todos.new
	end

	def edit
		if !current_user.admin?
			redirect_to todos_path, alert: "You don't have permission to do that."
		end
	end

	def create
		@todo = current_user.todos.new(todo_params)

		respond_to do |format|
			if @todo.save && current_user.admin?
				format.html { redirect_to todos_path, notice: "Task was sucessfully created"}
				format.js { }
			else
				format.html { render :new }
				format.js { }
			end
		end
	end

	def update
		if current_user.admin?
			respond_to do |format|
		      if @todo.update(todo_params) && current_user.admin?
		        format.html { redirect_to todos_path, notice: 'Task was successfully updated.' }
		        format.js { }
		      else
		        format.html { render :edit }
		        format.js { }
		      end
		    end
		else
			redirect_to todos_path, alert: "You don't have permission to do that."
		end
	end

	def destroy
		if current_user.admin?
			respond_to do |format|
				if @todo.destroy
		    		format.html { redirect_to todos_path, notice: 'Task was successfully destroyed.' }
		    		format.js { }
		    	else
		    		format.html { redirect_to todos_path, alert: 'Something went worng.' }
		    		format.js { }
		    	end
		    end
		else
			redirect_to todos_path, alert: "You don't have permission to do that."
		end
	end

	def complete
		#@dones = Todo.where(completed: true).all
		@todo.toggle_completion!
		@done = @todo
		respond_to do |format|
			format.html { redirect_to todos_path, notice: "Yay!" }
			format.js {  }
		end
	end

	def undo
		@todo.undo_completion!
		
		respond_to do |format|
			format.html { redirect_to todos_path, notice: "Oh, let's put it back." }
			format.js
		end
	end

	private

	def ensure_admin
		if current_user.admin?
			true
		else
			false
		end
	end

	def todo_params
		params[:todo].permit(:name)
	end

	def set_todo
		@todo = Todo.find(params[:id])
	end
end
