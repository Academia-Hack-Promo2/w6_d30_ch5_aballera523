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
		if user.save
			render json: {message: "Item To Do List Created", id: todo.id}
		else
			render json: {message: "Item To Do List Not Created"}
		end
	end

	def destroy
		todo = Todo.find (params[:id].to_i)
		if todo.destroy
			render json: {message: "Item #{text} was destroyed", id: todo.id}
		else
			render json: {message: "Item #{text} can't destroyed", id: todo.id}
		end
	end

	def update
		todo = Todo.update(params[:id].to_i, permit)
		render json: user
	end

	private
	def permit
		params.require(:todo).permit(:text, :done)
	end
end
