class CreateParaformalidades < ActiveRecord::Migration
  def change
    create_table :paraformalidades do |t|
     
      t.timestamps
    end
  end
end
