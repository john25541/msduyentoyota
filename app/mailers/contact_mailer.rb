class ContactMailer < ApplicationMailer
	
  def notification
    @contact = params[:contact]
    mail(to: 'nguyenvanloc1247@gmail.com', subject: 'Thông tin Khách hàng cần liên hệ')
  end
end
