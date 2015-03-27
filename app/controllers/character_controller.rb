class CharacterController < ApplicationController
  
  def createchar
    @character = Character.new(params(:character))
    if @character.save
      flash[:success] = "The character was saved successfully."
      redirect_to creator_path
    else
      render 'application#creator'
    end
  end
  
  def editchar
  end
  
  def deletechar
  end
  
  def showchar
  end
  
  def charindex
  end
  
end
