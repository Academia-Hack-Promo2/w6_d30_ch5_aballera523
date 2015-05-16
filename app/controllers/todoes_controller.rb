class TodoesController < ApplicationController
	def index
		task = Todo.all
		render json: task
	end

	def show
		exist = Todo.exists?(params[:id])
		if exist
			task = Todo.find(params[:id])
			render json: task			
		else
			render json: {message: "Item wasn't exist"}
		end
		
	end

	def create
		task = Todo.new(permit)
		if task.save
			render json: {message: "Item To Do List Created", id: task.id}
		else
			render json: {message: "Item wasn't exist"}
		end
	end

	def destroy
		exist = Todo.exists?(params[:id])
		if exist
			task = Todo.delete(params[:id])
			render json: {message: "Item was destroyed"}
		else
			render json: {message: "Item wasn't exist"}
		end
	end

	def update
		exist = Todo.exists?(params[:id])
		if exist
			task = Todo.update(params[:id], permit)
			render json: {message: "Item was updated"}
		else
			render json: {message: "Item wasn't exist"}
		end		
	end

	private
	def permit
		params.permit(:text, :done)
	end
end
