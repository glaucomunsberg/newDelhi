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
			format.json { render json:{"actionResponse"=>"index","status"=>"200","response"=>"Great Job!Format:JSON"} }
			format.xml { render xml:{"actionResponse"=>"index","status"=>"200","response"=>"Great Job!Format:XML"} }
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
		begin
			senses = Sense.all.select("id, descricao as description")
			render json:{
					"actionResponse"=>"sense",
					"status"=>"200",
					"response"=>senses
				}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def shift
		begin
			shift = Shift.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"shift",
				"status"=>"200",
				"response"=>shift
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def positionBody
		begin
			positionBody = PositionBody.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"positionBody",
				"status"=>"200",
				"response"=>positionBody
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end	
	end
	
	def numberBody
		begin
			numberBody = NumberBody.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"numberBody",
				"status"=>"200",
				"response"=>numberBody
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def equipmentScale
		begin
			equipmentScale = EquipmentScale.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"equipmentScale",
				"status"=>"200",
				"response"=>equipmentScale
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def equipmentMobility
		begin
			equipmentMobily = EquipmentMobility.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"equipmentMobily",
				"status"=>"200",
				"response"=>equipmentMobily
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def equipmentInstalation
		begin
			equipmentInstalation = EquipmentInstalation.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"equipmentInstalation",
				"status"=>"200",
				"response"=>equipmentInstalation
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def registeredActivity
		begin
			registeredActivity = RegisteredActivity.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"registeredActivity",
				"status"=>"200",
				"response"=>registeredActivity
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def climate
		begin
			climate = Climate.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"climate",
				"status"=>"200",
				"response"=>climate
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def localizationSpace
		begin
			localizationSpace = LocalizationSpace.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"localizationSpace",
				"status"=>"200",
				"response"=>localizationSpace
			}
		rescue Exception => e
			
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def registeredAmount
		begin
			registeredAmount = RegisteredAmount.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"registeredAmount",
				"status"=>"200",
				"response"=>registeredAmount
			}
		rescue Exception => e
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def scene
		begin
			scene = Scene.all.select("id, grupo_atividade_id as activity_group_id, contribuicao_publica as public_contribution, descricao as description").where("estaativo = 'S'")
			render json:{
				"actionResponse"=>"scene",
				"status"=>"200",
				"response"=>scene
			}
		rescue Exception => e
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def environmentalCondition
		begin
			environmental = EnvironmentalConditions.all.select("id, descricao as description")
			render json:{
				"actionResponse"=>"environmentalCondition",
				"status"=>"200",
				"response"=>environmental
			}
		rescue Exception => e
			render json: {
				"actionResponse"=>"sense",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end
	
	def isOnAir
		render json: {
			"actionResponse"=>"isOnAir",
			"status"=>"200",
		 	"response"=>"Yes, we are on Air and at the floor too!"	
		}
	end
	
	def about
		render json:{
			"actionResponse"=>"about",
			"status"=>"200",
			"response"=>[
				"service"=>@service,
				"version"=>@version,
				"developer"=>@developer,
				"update"=>@lastUpdate,
				"status"=>
				[
					{"200"=>"Sucess(OK)"},
					{"203"=>"The server successfully processed the request (Non-Authoritative Information)"},
					{"400"=>"Invalid widget was reqested (Bad Request)"},
					{"401"=>"Invalid authorization credentials (Unauthorized)"},
					{"403"=>"Invalid timestamp in Date header (Forbidden)"},
					{"404"=>"Unsupported method or format (Not Found)"},
					{"500"=>"The server cannot process the request due to a system overload. This should be a temporary condition (Server Error)"}
				]
			]
			
		}
	end
end