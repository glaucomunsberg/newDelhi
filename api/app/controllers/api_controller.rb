class ApiController < ApplicationController
	respond_to :json
	def index
		respond_to do |format|
			format.json { render :json =>"Great Job!"}
			format.html
		end
	end
end