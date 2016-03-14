class HomeController < ApplicationController

  before_action :authenticate_user!
  def site
  end
end
