class TodosController < ApplicationController
	before_action :set_todo, only: [:show, :edit, :update, :destroy, :complete]
	
	def index
		@todos = Todo.where(completed: false)
		@completes = Todo.where(completed: true)
	end

	def new
		
	end

	def show
		
	end

	def edit
		
	end

	def create
		redirect_to todos_path
	end

	def update
		redirect_to todos_path
	end

	def destroy
		redirect_to todos_path
	end

	def complete
		@todo.toggle_completion!
		redirect_to todos_path, success: "Todo completed!"
	end

	private

	def set_todo
		@todo = Todo.find(params(:id))
	end
end
