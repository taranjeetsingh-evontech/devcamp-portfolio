class PortfoliosController < ApplicationController
	def index
		@portfolio_items = Portfolio.all
		puts 'HEREEEEEEEE'
	end
end
