class People < ActiveRecord::Base
	self.table_name = "public.pessoas"
	self.primary_key = "id"
end