class NotesController < ApplicationController
  def create
    if logged_in?
      @expenses = Expense.find(params[:expense_id])
      @notes = @expenses.notes.create(note_params)
      @notes.user_id = session[:user_id]
      @notes.save
      redirect_to expense_path(@expenses)
    else
      redirect_to root_path
    end
  end

  private
    def note_params
      params.require(:note).permit(:body)
    end
end

