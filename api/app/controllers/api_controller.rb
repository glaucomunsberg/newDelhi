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

	def paraformalidade
		params.each do |key,value|
		  Rails.logger.warn "Param #{key}: #{value}"
		end
		paraformalidade = Paraformalidade.limit 10
		render json:paraformalidade
	end

	def sense
		senses = Sense.all.select("id, descricao as description")
		render json:senses
	end

	def shift
		shift = Shift.all.select("id, descricao as description")
		render json:shift
	end
	
	def positionBody
		positionBody = PositionBody.all.select("id, descricao as description")
		render json:positionBody
	end
	
	def numberBody
		numberBody = NumberBody.all.select("id, descricao as description")
		render json:numberBody
	end

	def equipmentScale
		equipmentScale = EquipmentScale.all.select("id, descricao as description")
		render json:equipmentScale
	end

	def equipmentMobility
		equipmentMobily = EquipmentMobility.all.select("id, descricao as description")
		render json:equipmentMobily
	end

	def equipmentInstalation
		equipmentInstalation = EquipmentInstalation.all.select("id, descricao as description")
		render json:equipmentInstalation
	end

	def registeredActivity
		registeredActivity = RegisteredActivity.all.select("id, descricao as description")
		render json:registeredActivity
	end

	def climate
		climate = Climate.all.select("id, descricao as description")
		render json:climate
	end

	def localizationSpace
		localizationSpace = LocalizationSpace.all.select("id, descricao as description")
		render json:localizationSpace
	end

	def registeredAmount
		registeredAmount = RegisteredAmount.all.select("id, descricao as description")
		render json:registeredAmount
	end

	def scene
		scene = Scene.all.select("id, grupo_atividade_id as activity_group_id, contribuicao_publica as public_contribution, descricao as description").where("estaativo = 'S'")
		render json:scene
	end

	def environmentalCondition
		environmental = EnvironmentalConditions.all.select("id, descricao as description")
		render json:environmental
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