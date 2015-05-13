class CreateArticle < ActiveRecord::Migration
  def change
  	create_table :articles do |t|
  			t.string :sujet
  			t.string :name
  			t.string :message
  			
  			t.timestamps	
  	end
  end
end
