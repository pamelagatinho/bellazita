class Client < ActiveRecord::Base

  has_many :orders
  
	EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	BIRTHDAY_REGEXP = /^(([012][0-9])|(3[01]))\/(0[1-9]|1[012])/

	validates_presence_of :name, :email, :phone_number, :birthday
	validates_uniqueness_of :email

	validate do 
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)	
		errors.add(:birthday, :invalid) unless birthday.match(BIRTHDAY_REGEXP)
		
	end

end
