class HomeController < ApplicationController
  def index
  	@memoid = Memoid.all
  	# n = rand(Memoid.all.size)
  	# @memoid = Memoid.find_by_id n if Memoid.find_by_id n
  	# binding.pry
  end
end
