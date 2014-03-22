class RegisteredAmount < ActiveRecord::Base
	self.table_name = "paraformal.quantidades_registrada"
	self.primary_key = "id"
end