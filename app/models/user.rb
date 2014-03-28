class User < ActiveRecord::Base
  validates_presence_of :name,:username,:email,:password
  validates_uniqueness_of :username,:email
  attr_accessor :password
has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "411x274>", :large => "1280x854>" }, :default_url => "missing.gif"  
 before_save :encrypt_password

 def encrypt_password
 if password.present?
 self.password_salt = BCrypt::Engine.generate_salt
 self.password_hash = BCrypt::Engine.hash_secret(password,password_salt)
 end
 end
 
 def self.authenticate(email, password)
user = find_by_email(email)
if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
user
else
nil
end
end



end
