class WelcomeController < ApplicationController

  def index
    redirect_to new_session_path
  end


end
