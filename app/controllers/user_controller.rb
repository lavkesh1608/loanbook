class UserController < ApplicationController
  include BookHelper
  include UserHelper
  protect_from_forgery 
  
  def create_user
    
  @user=User.create(user_params)
  if @user.save
   redirect_to root_url ,:notice=>"Registred Successfuly Please do login"
  else
    render "home/index" ,:notice=>"There was a problem"
   
  end
  end
  
  def check_username
    @user=User.where(:username=>params[:Uname]).first
    
      respond_to do |format|
    if @user.present?
        format.json {render :json=>@user}
   else 
     @status="false"
     format.json {render :json=>@status}
    end
   end
    
  end
  
  def user_home
    if session[:user_id]
    @user=User.where(:id=>session[:user_id]).first
    else
    redirect_to root_url ,:notice=>"Please do login first"
    end
  end
  
  def notification
     @notification=Notification.where(:status=>"unread",:not_to=>session[:user_id])
    
      respond_to do |format|
    if @notification.present?
        format.json {render :json=>@notification}
   else 
     @status="false"
     format.json {render :json=>@status}
    end
   end
    
  end
  
  
  def update_notification
  @notification =Notification.where(:id=>params[:Nid]).first
  @notification.update_attributes(:status => "read")
  
   #@notification.update_attribute(:status, "read")
    respond_to do |format|
      if @notification.save
   
     format {render :json=>@notification }
      end
   end  
  end
  
  def borrower_page
    @arrdays=[]
    @arrreturndate=[]
    @bookreq=BookRequest.where(:user_id=>session[:user_id])
    
    @bookreq.each do |r|
    @bookres=BookResponse.where(:book_request_id=>r.id).first
    if @bookres.present?
    @daysleft=DateTime.parse(@bookres.return_date.to_s).mjd-DateTime.now.mjd 
    @arrreturndate<<@bookres.return_date
    @arrdays<<@daysleft.to_i
    end
    
    end
    
    
      
  end
  
  def lander_page
    @arrdays=[]
    @arrreturndate=[]
    @bookreq=BookRequest.where(:lander_book_id=>session[:user_id])
     if @bookreq.present?
    @bookreq.each do |r|
    @bookres=BookResponse.where(:book_request_id=>r.id).first
    if @bookres.present?
    @daysleft=DateTime.parse(@bookres.return_date.to_s).mjd-DateTime.now.mjd 
    @arrreturndate<<@bookres.return_date
    @arrdays<<@daysleft.to_i  
    end
    
    end
    end
     
  end
  
  def user_account
    @user=User.where(:id=>session[:user_id]).first  
  end
  
  def update
    @user=User.where(:id=>session[:user_id]).first
    @user.update_attributes(user_params)
    
    if @user.save
    render "user_account" , :notice=>"User Updated Successfuly"
    else 
    render :user_account , :notice=>"There was a Successfuly"
      
      
    end
    
    
  end 
  
  private
  def user_params
    params.require(:user).permit(:name,:username,:email,:password,:shipping_address,:phone,:city,:zip_code,:photo,:width,:height,:marginleft,:marginright)
  end
  
end
