class EntriesController < ApplicationController

	before_filter :authorize, :except => [:index, :show]

	def index
		@entries = Entry.all.order('created_at DESC')
	end

	def show
		@entry = Entry.find(params[:id])
		@author = User.find(@entry.user_id).name
	end

	def new
		@entry = Entry.new
	end

	def create
		user = current_user
		@entry = user.entries.new(entry_params)
		# @entry = Entry.new(entry_params)
		if @entry.save
			redirect_to @entry
		else
			render 'new'
		end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update
		@entry = Entry.find(params[:id])
		if @entry.update(params[:entry].permit(:title, :content))
			redirect_to @entry
		else
			render 'edit'
		end
	end

	def destroy
		@entry = Entry.find(params[:id])
		@entry.destroy

		redirect_to entries_path
	end

	private
		def entry_params
			params.require(:entry).permit(:title, :content)
		end
end