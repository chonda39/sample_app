class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
  	#Rails method called add_index to add an index 
  	#on the email column of the users table.
  	add_index :users, :email, unique: true
  end
end
