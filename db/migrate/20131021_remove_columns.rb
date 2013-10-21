class RemoveColumns < ActiveRecord::Migration
  	def self.up
  		remove_column :users, :username
	end
end
