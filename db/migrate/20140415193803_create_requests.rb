class CreateRequests < ActiveRecord::Migration
  def change
  	create_table :requests do |t|
  		t.string :user_city
  		t.string :user_state
  		t.string :user_msa
  		t.string :user_type
  		t.string :request_id
  		t.datetime :request_time
  		t.string :form_name
  		t.string :drug_name
  		t.date :month_part
  		t.string :territory
  		t.string :district_number
  	end
  end
end
