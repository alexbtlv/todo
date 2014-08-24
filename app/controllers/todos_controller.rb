class TodosController < ApplicationController
	before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete, :undo]
	before_filter :authenticate_user!
	
	def index
		@todos = Todo.where(completed: false).all
		@completes = Todo.where(completed: true).all
	end

	def new
		@todo = current_user.todos.new
	end

	def show
		
	end

	def edit
		
	end

	def create
		@todo = current_user.todos.new(todo_params)

		respond_to do |format|
			if @todo.save
				format.html { redirect_to todos_path, notice: "Task was sucessfully created"}
				format.js { }
			else
				format.html { render :new }
				format.js { }
			end
		end
	end

	def update
		respond_to do |format|
	      if @todo.update(todo_params)
	        format.html { redirect_to todos_path, notice: 'Task was successfully updated.' }
	        format.js { }
	      else
	        format.html { render :edit }
	        format.js { }
	      end
	    end
	end

	def destroy
		@todo.destroy
		
	    respond_to do |format|
	      format.html { redirect_to todos_path, notice: 'Task was successfully destroyed.' }
	      format.js { }
	    end
	end

	def complete
		@completes = Todo.where(completed: true).all
		@todo.toggle_completion!
		
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

	def todo_params
		params[:todo].permit(:name)
	end

	def set_todo
		@todo = Todo.find(params[:id])
	end
end
