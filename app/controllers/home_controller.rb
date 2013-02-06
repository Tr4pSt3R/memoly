class HomeController < ApplicationController
  def index
  	@memoid = Memoid.all
  end
end
