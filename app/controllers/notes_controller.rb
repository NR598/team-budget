class NotesController < ApplicationController
  def create
    @transactions = Transaction.find(params[:transaction_id])
    @notes = current_user.notes.create(note_params)
    @transactions.note.user = current_user.name
    redirect_to transaction_path(@transactions)
  end

  private
    def note_params
      params.require(:note).permit(:user, :body)
    end
end
