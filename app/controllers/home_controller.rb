class HomeController < ApplicationController
	include AuthHelper

  def show
  	if signed_in?
  		redirect_to dashboards_path
  	end
  end
end
