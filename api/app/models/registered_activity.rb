class RegisteredActivity < ActiveRecord::Base
	self.table_name = "paraformal.atividades_registradas"
	self.primary_key = "id"
end