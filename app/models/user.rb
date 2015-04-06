class User < ActiveRecord::Base
	has_many :entries

	def password=(plain_password)
		self.password_digest = BCrypt::Password.create(plain_password)
	end

	def self.authenticate(email, password)
		user = User.find_by(email: email)
		user if user && user.password == password
	end

	def password
		@password ||= BCrypt::Password.new(self.password_digest)
	end
end