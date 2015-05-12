class AttackController < ApplicationController
  before_action :user_logged_in
  
  def create
    @attack = current_user.characters.find(params[:attack][:character_id]).attacks.create
    render :json => @attack
  end
  
  def update
    @attack = current_user.characters.find(params[:attack][:character_id]).attacks.find(params[:attack][:id])
    @attack.update_attributes(attack_params)
    render :json => @attack
  end
  
  def index
    @attacks = current_user.characters.find(params[:character_id]).attacks
    render :json => @attacks
  end
  private
  
  def attack_params
    params.require(:attack).permit!    
  end
end
