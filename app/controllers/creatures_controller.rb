class CreaturesController < ApplicationController
	
	def index
		@creature = Creature.all
		render :index
	end

	def new
		render :new
	end

	def create
		creature = params[:creature].permit(:name, :description)
		new_creature = Creature.create(creature)
		redirect_to "/creatures/#{new_creature.id}"
	end

	def show
		id = params[:id]
		@creature = Creature.find(id)
		render :show
	end

	def edit
		id = params[:id]
		@creature = Creature.find(id)
		render :edit
	end

	def update
		id = params[:id]
		creature = Creature.find(id)
		updated_info = params[:creature].permit(:name, :description)
		creature.update_attributes(updated_info)
		redirect_to "/creatures/#{id}"
	end

	def destroy
		id = params[:id]
		creature = Creature.find(id)
		creature.destroy
		redirect_to "/creatures"
	end

end