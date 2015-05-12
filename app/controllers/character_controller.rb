class CharacterController < ApplicationController
  before_action :user_logged_in
  
  def create
    @character = current_user.characters.new(params[:character])
    if @character.save
      render :json => @character
    else
      render :json => @character
    end
  end
  
  def update
    @character = current_user.characters.find(params[:id])
    puts params[:character].inspect
    if @character.update_attributes(charparams)
      render :json => @character
    else

    end
  end
  
  def destroy
    current_user.characters.find(params[:id]).destroy
    head :no_content
  end
  
  def show
    render :json => current_user.characters.find(params[:id])
  end
  
  def index
    @characters = current_user.characters.all
    render :json => @characters
  end
  private 
    def charparams
      params.require(:character).permit!
    end
end
