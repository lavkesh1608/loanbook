module ApplicationHelper
  def getBookDetail(id)
    @book=Book.where(:id=>id).first
    return @book
  end
  
end
