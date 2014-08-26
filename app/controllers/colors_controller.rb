# app/controllers/colors_controller.rb

class ColorsController < ApplicationController
  # GET /
  def index

  end # action index

  # DELETE /pop
  def pop
    head 403 and return unless request.xhr?

    head 404 and return if (color = Color.last).blank?

    render :json => color

    color.destroy
  end # action pop
end # controller
