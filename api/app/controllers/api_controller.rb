class ApiController < ApplicationController
	respond_to :json, :html, :xml
	
	def initialize
		@service 	= "newDalhi"
		@version 	= "1.0"
		@developer 	= "Glauco Roberto Munsberg dos Santos"
		@lastUpdate	= Time.new 
	end
	
	def index
		respond_to do |format|
			format.json { render json:{"actionResponse"=>"index","status"=>"200","response"=>"Great Job!Format:JSON"} }
			format.xml { render xml:{"actionResponse"=>"index","status"=>"200","response"=>"Great Job!Format:XML"} }
			format.html 
		end
	end
	
	def scenesByLocalization

		params.each do |key,value|
			Rails.logger.warn "Param #{key}: #{value}"
		end
		begin
			scene = Scene.all(:select => 'cenas.id as cena_id, p.id as paraformalidade_id, p.geo_latitude, p.geo_longitude, cenas.descricao as cena_descricao, p.descricao as paraformalidade_descricao, p.turno_ocorrencia_id, p.atividade_registrada_id, p.espaco_localizacao_id, p.corpo_numero_id, p.corpo_posicao_id, p.equipamento_porte_id, p.equipamento_mobilidade_id, u.nome_gerado, p.link, cenas.dt_ocorrencia, p.dt_cadastro, p.quantidade_registrada_id, p.contribuicao_publica', :conditions=>" estaativa = 'S' and estaativo = 'S'",:joins => "INNER JOIN paraformal.paraformalidades as p on p.id = (select para.id from paraformal.paraformalidades as para where para.cena_id = cenas.id order by dt_ocorrencia DESC limit 1) INNER JOIN uploads as u on u.id = p.upload_id")
			render json:{
				"actionResponse"=>"scenesByLocalization",
				"status"=>"200",
				"response"=>scene
			}
		rescue Exception => e
			render json:{
				"actionResponse"=>"scenesByLocalization",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end 

	#Nao usado
	def paraformalidadeByLocalization
		params.each do |key,value|
		  Rails.logger.warn "Param #{key}: #{value}"
		end
		begin
			paraformalidade = Paraformalidade.all(:select=> "*" ,:conditions=>"estaativa = 'S'",:joins =>" INNER JOIN public.uploads on public.uploads.id = paraformal.paraformalidades.upload_id")
			render json:{
					"actionResponse"=>"paraformalidadeByLocalization",
					"status"=>"200",
					"response"=>paraformalidade
				}
		rescue Exception => e
			render json: {
				"actionResponse"=>"paraformalidadeByLocalization",
				"status"=>"500",
				"response"=>e.message
			}
		end
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
				"actionResponse"=>"shift",
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
				"actionResponse"=>"positionBody",
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
				"actionResponse"=>"numberBody",
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
				"actionResponse"=>"equipmentScale",
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
				"actionResponse"=>"equipmentMobily",
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
				"actionResponse"=>"equipmentInstalation",
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
				"actionResponse"=>"registeredActivity",
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
				"actionResponse"=>"climate",
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
				"actionResponse"=>"localizationSpace",
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
				"actionResponse"=>"registeredAmount",
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
				"actionResponse"=>"environmentalCondition",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end

	def personByEmail
		begin
			if params[:email] == nil
				render json: {
					"actionResponse"=>"getPersonByEmail",
					"status"=>"400",
					"response"=>"Send the email to get person"
				}
			else
				person = People.where(:email => params[:email]).select("id, nome,sexo as genero,dt_nascimento,conexao_social,conexao_social_id,email")
				render json:{
					"actionResponse"=>"getPersonByEmail",
					"status"=>"200",
					"response"=>person
				}
			end 
		rescue Exception => e
			render json: {
				"actionResponse"=>"getPersonByEmail",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end

	def personById
		begin
			if params[:id] == nil
				render json: {
					"actionResponse"=>"getPersonByEmail",
					"status"=>"400",
					"response"=>"Send the id aurora (plataforma paraformal) to get person"
				}
			else
				person = People.where(:id => params[:id]).select("id, nome,sexo as genero,dt_nascimento,conexao_social,conexao_social_id,email")
				render json:{
					"actionResponse"=>"getPersonByEmail",
					"status"=>"200",
					"response"=>person
				}
			end 
		rescue Exception => e
			render json: {
				"actionResponse"=>"getPersonByEmail",
				"status"=>"500",
				"response"=>e.message
			}
		end
	end

	def setPersonBySocialConnection
		if params[:name] == nil or params[:email] == nil or params[:social_connection] == nil or params[:social_connection_id] == nil or params[:gender] == nil
				render json: {
					"actionResponse"=>"setPersonBySocialConnection",
					"status"=>"400",
					"response"=>"To send a person you need informat name,email,social_connection,social_connection,social_connection_id,gender"
				}
			else

				person = People.where(email: params[:email])
				Rails.logger.warn person.count
				Rails.logger.warn person.first.id
				if person.count > 0
					
					#update information
					conexao_social_id = params[:social_connection_id]
					conexao_social = params[:social_connection]
					id = person.first.id
					if params[:social_connection] != "T"
						People.find_by_sql(
							"UPDATE public.pessoas SET conexao_social = '#{conexao_social}', conexao_social_id = '#{conexao_social_id}' WHERE id = #{id};"
						)
					end
					render json:{
						"actionResponse"=>"setPersonBySocialConnection",
						"status"=>"200",
						"response"=>person
					}
				else
					People.create(nome: params[:name],email: params[:email],conexao_social: params[:social_connection], conexao_social_id: params[:social_connection_id], sexo: params[:gender])
					person = People.where(email: params[:email]).limit(1)
					render json:{
						"actionResponse"=>"setPersonBySocialConnection",
						"status"=>"200",
						"response"=>person
					}
				end
				
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
					{"400"=>"Invalid widget was requested (Bad Request)"},
					{"401"=>"Invalid authorization credentials (Unauthorized)"},
					{"403"=>"Invalid timestamp in Date header (Forbidden)"},
					{"404"=>"Unsupported method or format (Not Found)"},
					{"500"=>"The server cannot process the request due to a system overload. This should be a temporary condition (Server Error)"}
				]
			]
			
		}
	end
end