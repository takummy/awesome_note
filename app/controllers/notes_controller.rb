class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy]

  def index
    @notes = Note.all
  end

  def new
    if params[:back]
      @note = Note.new(note_params)
    else
      @note = Note.new
    end
  end

  def confirm
    @note = Note.new(note_params)
    render :new if @note.invalid?
  end

  def create  
    @note = Note.new(note_params)
    if @note.save
      flash[:success] = '投稿しました！'
      redirect_to notes_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @note.update(note_params)
      flash[:info] = '編集しました！'
      redirect_to notes_path
    else
      render :edit
    end
  end

  def destroy
    @note.destroy
    flash[:info] = '削除しました！'
    redirect_to notes_path
  end

  private
  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:content)
  end
end
