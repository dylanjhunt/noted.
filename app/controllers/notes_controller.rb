class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def show
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    if @note.save
      flash[:success] = "Added"
      redirect_to '/notes'
    else
      render 'notes/new'
    end
  end

  def destroy
  @note = Note.find(params[:id])
  @note.destroy
  redirect_to :root
  end

  private
    def note_params
      params.require(:note).permit(:title)
    end

end
