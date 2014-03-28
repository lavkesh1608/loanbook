class HomeController < ApplicationController
  def index
    @user=User.new
  end
  
   # if params[:entity_image]
   #           post_image = (params[:entity_image]).gsub(" ", "+")
   #          @entity_image = StringIO.new(Base64.decode64(post_image))
   #         @entity_image.class.class_eval { attr_accessor :original_filename, :content_type }
   #        @entity_image.original_filename = "entity_image.png"
   #       @entity_image.content_type = "image/png"
   # end
  

  
end
