class Book < ActiveRecord::Base
 validates_presence_of :title, :tag, :category_id
 has_attached_file :book_image, :styles => { :medium => "300x300>", :thumb => "100x100>", :small => "411x274>", :large => "1280x854>" }, :default_url => "missing.gif"  
  
end
