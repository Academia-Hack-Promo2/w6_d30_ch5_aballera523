class TodoesController < ApplicationController
	def index
		todo = Todo.all
		render json: todo
	end

	def show
		todo = Todo.find(params[:id].to_i)
		render json: todo
	end

	def create
		todo = Todo.new(permit)
		if todo.save
			render json: {message: "Item To Do List Created", id: todo.id}
		else
			render json: {message: "Item To Do List Not Created"}
		end
	end

	def destroy
		todo = Todo.find (params[:id])
		if todo.destroy
			render json: {message: "Item #{text} was destroyed"}
		else
			render json: {message: "Item #{text} can't destroyed"}
		end
	end

	def update
		todo = Todo.update(params[:id].to_i, permit)
		render json: todo
	end

	private
	def permit
		params.require(:todo).permit(:text, :done)
	end
end
