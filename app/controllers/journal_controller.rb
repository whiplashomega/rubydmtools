class JournalController < ApplicationController
  before_action :user_logged_in  
  
  def create
   @journal = current_user.journals.new(journal_params)
    if @journal.save
      render :json => @journal
    else
      render :json => @journal
    end
  end
  
  def destroy
    current_user.journals.find(params[:id]).destroy
    head :no_content
  end
  
  def index
    @journals = current_user.journals.all
    render :json => @journals
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:date, :text)
    end
end
