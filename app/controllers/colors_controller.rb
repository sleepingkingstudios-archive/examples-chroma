# app/controllers/colors_controller.rb

class ColorsController < ApplicationController
  # GET /
  def index

  end # action index

  # GET /about
  def about
    
  end # action about

  # DELETE /pop
  def pop
    redirect_to root_path and return unless request.xhr?

    head 404 and return if (color = Color.last).blank?

    render :json => color

    color.destroy
  end # action pop
end # controller
