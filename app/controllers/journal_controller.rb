class JournalController < ApplicationController
  before_action :set_journal, only: [:show, :edit, :update, :destroy]
  before_action :user_logged_in
  before_action :owns_task, only: [:update, :destroy]

  def show
  end

  def edit
  end
  
  def new
    @journal = current_user.journals.new
  end
  
  def create
    @journal = current_user.journals.new(journal_params)

    respond_to do |format|
      if @journal.save
        format.html { redirect_to @journal, notice: 'Journal was successfully created.' }
        format.json { render :show, status: :created, location: @journal }
      else
        format.html { render :new }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @journal.destroy
    respond_to do |format|
      format.html { redirect_to journals_url, notice: 'Journal entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def index
    @journals = current_user.journals.all
  end
  
  def update
    respond_to do |format|
      if @journal.update(journal_params)
        format.html { redirect_to @journal, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @journal }
      else
        format.html { render :edit }
        format.json { render json: @journal.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
     def owns_journal
     if @task.user_id != current_user.id
        flash[:danger] = 'You are not authorized to do this'
        redirect_to root_url
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_journal
      if params[:user_id]
        @task = current_user.tasks.find(params[:id])
      else
        @task = Task.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def journal_params
      params.require(:journal).permit(:date, :text)
    end
end
