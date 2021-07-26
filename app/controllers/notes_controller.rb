class NotesController < ApplicationController
  def create
    if logged_in?
      @transactions = Transaction.find(params[:transaction_id])
      @notes = @transactions.notes.create(note_params)
      @notes.user_id = session[:user_id]
      @notes.save
      redirect_to transaction_path(@transactions)
    else
      redirect_to root_path
    end
  end

  private
    def note_params
      params.require(:note).permit(:body)
    end
end

