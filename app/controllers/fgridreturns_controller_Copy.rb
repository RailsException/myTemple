class FgridreturnsController < ApplicationController
  def getalldonars
  	@donors = Donar.all
  	render json: @donors  
  end
end
