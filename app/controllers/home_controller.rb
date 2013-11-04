class HomeController < ApplicationController

	before_action :require_login, :only => :index

  def index
  end

  def secret
  end
end
