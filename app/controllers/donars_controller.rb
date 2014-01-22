class DonarsController < ApplicationController
	before_filter :check_login , :check_adminorpriest
  def listdonars
  end
end
