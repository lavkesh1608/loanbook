module UserHelper
  
  def getUserDetail(id)
    @user=User.where(:id=>id).first
    return @user
  end
  
  def getNotification
    @notification=Notification.where(:status=>"unread",:not_to=>session[:user_id])
    return @notification
  end
  
end
