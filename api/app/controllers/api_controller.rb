class ApiController < ApplicationController
	respond_to :json, :html, :xml
	
	def initialize
		@service 	= "newDalhi"
		@version 	= "1.0"
		@developer 	= "Glauco Roberto Munsberg dos Santos"
		@lastUpdate	= Time.new 2014,03,22
	end
	
	def index
		respond_to do |format|
			format.json { render :json =>"Great Job!Format:JSON"}
			format.xml { render :json =>"Great Job!Format:XML" }
			format.html 
		end
	end

	def paraformalidades
		params.each do |key,value|
		  Rails.logger.warn "Param #{key}: #{value}"
		end
		paraformalidade = Paraformalidade.limit 10
		render json:paraformalidade
	end

	def isOnAir
		render json: {
			"status"=>"200",
		 	"isOnAir"=>"Yes, we are on Air and at the floor too!"	
		}
	end

	def about
		render json:{
			"service"=>@service,
			"version"=>@version,
			"developer"=>@developer,
			"update"=>@lastUpdate,
			"status"=>
			[
				{"200"=>"Sucess(OK)"},
				{"400"=>"Invalid widget was reqested (Bad Request)"},
				{"401"=>"Invalid authorization credentials (Unauthorized)"},
				{"403"=>"Invalid timestamp in Date header (Forbidden)"},
				{"404"=>"Unsupported method or format (Not Found)"}
			]
		}
	end
end