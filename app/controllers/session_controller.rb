class SessionController < ApplicationController
  def new
  if session[:user_id]
     redirect_to user_home_path 
  else
    render "new"
  end
    
  end
  
 def create
  user = User.authenticate(params[:email], params[:password])
  if user
  session[:user_id] = user.id
  redirect_to user_home_path, :notice => "Welcome #{user.name}"

  else
  flash.now.alert = "Invalid email or password"
  render "new"
  end
 end
 
 def fbcreate
   
   puts"%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%{params.inspect}"
     user = Fbuser.from_omniauth(env["omniauth.auth"])
     session[:user_id] = user.id
     session[:fb_token] = user.oauth_token
   redirect_to user_home_path, :notice => "Welcome #{user.name}"
  
 end

 
 def destroy
   
  session[:user_id]=nil
        
  if session[:fb_token]
      redirect_to "https://www.facebook.com/logout.php?next=#{root_url}&access_token=#{session[:fb_token]}"
  else
      redirect_to root_url ,:notice=>"logout successfuly"
  end
   
 end

end
