class NotesController < ApplicationController

	before_action :find_note, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!

	def index
		@notes = Note.paginate(page: params[:page], per_page: 12).order(created_at: :desc)
	end

	def show
	end

	def new
		@note = current_user.notes.build
	end

	def create
		@note = current_user.notes.build(note_params)

		if @note.save
			redirect_to @note
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		@note.update(note_params)

		if @note.save
			redirect_to @note
		else
			render 'edit'
		end
	end

	def destroy
		@note.destroy
		redirect_to root_url
	end


	private

	def find_note
		@note = Note.find(params[:id])
	end

	def note_params
		params.require(:note).permit(:title, :content)
	end
end
