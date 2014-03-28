module BookHelper
   def getBookDetail(id)
    @book=Book.where(:id=>id).first
    return @book
  end
  
  def getUserDetail(id)
    @user=User.where(:id=>id).first
    return @user
  end
end
