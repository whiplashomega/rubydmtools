class DmController < ApplicationController
  def creator
    @character = Character.new
  end
  
  def dashboard
  end
end
