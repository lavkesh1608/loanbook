class BookController < ApplicationController
  include BookHelper
  protect_from_forgery 
  
  layout "user"
  
  def new
    @book=Book.new
    render :layout=>"user"
  end
  
  def create
    @book=Book.create(book_params)
    if @book.save
    redirect_to user_home_path, :notice=>"Book Added Successfuly"
    else
      render "new" ,:notice=>"Book Not Added"
    end
  end
  
  def search_book
    q=params[:Booktext]
    @book=Book.where('title LIKE ?', "%#{params[:Booktext]}%")
    #puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{@book.inspect}"
     #where('title LIKE ?', "%#{params[:Booktext]}%")
     #where(:title=>params[:Booktext]).all
     #Yogesh:  @user_entity_with_recent = (UserEntity.,:is_active => "true").in(:user_category_id => @cate).order_by(:created_at => "desc")| UserEntity.where(:is_active => "true",:sub_category => Regexp.new(("."+q+"."), Regexp::IGNORECASE)).in(:user_category_id => @cate).order_by(:created_at => "desc") ).group_by { |t| t.api_id }
   respond_to do |format|
       format.json {render :json=>@book}
       puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%#{@book.inspect}"
   end
   
 end
   
   
   def search_book_by_cate
     @book=Book.where(:category_id=>params[:Cid])
       respond_to do |format|
       format.json {render :json=>@book}
       
     end
   end
   
   
   def user_book
   @book=Book.where(:user_id=>session[:user_id])  
   end
   
   def all_book
   @book=Book.all 
   @cate=Category.all
   end
  
  
  def book_request
    
    if session[:user_id]
      @book=Book.where(:id=>params[:id]).first 
    
      #@book_lander=User.where(:id=>params[:Book_lander_id]).first
    
      render "book_request", :layout => "layouts/user"
 
    else
      
      redirect_to root_url ,:notice=>"Please login first.........."
                    
    end
    
  end
  
  def book_response
    @bookreq=BookRequest.where(:id=>params[:id]).first
    @bookres=BookResponse.new
    #@book_lander=User.where(:id=>params[:Book_lander_id]).first
    
    render "book_response" , :layout => "layouts/user"
      
  end

   def create_book_response
    @bookres=BookResponse.new
    @bookres.book_request_id=params[:book_response][:request_id]
    @bookres.return_date=params[:book_response][:return_date]
    @bookres.status="Delivered"
    @bookres.save
    
    if @bookres.save
    @reqbookstatus=BookRequest.where(:id=>params[:book_response][:request_id]).first
    @book=Book.where(:id=> @reqbookstatus.book_id).first
    @book.update_attributes(:status => "loaned Out")
    @reqbookstatus.update_attributes(:status => "Delivered")  
     
    redirect_to lander_page_path ,:notice=>"Request Proceed Successfully"
     
    else
       render :action=>"book_response"
    end
       
    
  end
   def add_cate
    
   @cate=Category.new 
   end
   
   def create_cate
     @cate=Category.create(cate_params)
    if @cate.save
    redirect_to add_cate_path ,:notice=>"Category Added Successfully"
    else
      redirect_to add_cate_path ,:notice=>"There was a problem" 
   end
   end 
   
   def cate_params
     params.require(:cate).permit(:name,:description)
   end
     
  
   def create_book_request
      
    @book_lander_id=Book.where(:id=>params[:book_request][:book_id]).first
   
    @bookreq=BookRequest.new
    @bookreq.book_id=params[:book_request][:book_id]
    @bookreq.lander_book_id=@book_lander_id.user_id
    @bookreq.user_id=session[:user_id]
    @bookreq.status="Waiting"
    @bookreq.date_of_request= Time.now
    @bookreq.save!
   
    if @bookreq.save
      @notification=Notification.new
      @notification.update_attributes(:not_by=>session[:user_id],:not_msg=>"One user want to borrow your book",:not_to=>@book_lander_id.user_id,:status=>"unread",:is_active=>"1")
    if @notification.save
      redirect_to user_home_path, :notice=>"Book Request Successfuly"
    else
      render user_home_path, :notice=>"Book Request Not Send"
    end
    
    end
             
   end
  
  

  def book_params
    params.require(:book).permit(:title,:tag,:description,:category_id,:user_id,:status,:book_image)
  end
  
end
