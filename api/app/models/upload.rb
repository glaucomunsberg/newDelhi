class People < ActiveRecord::Base
	self.table_name = "public.uploads"
	self.primary_key = "id"
end