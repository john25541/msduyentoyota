class ContactMailer < ApplicationMailer

	default :from => "\"Ms.DuyenToyota\" <no-reply@toyotagovap.vn>",
          reply_to: -> { "nguyenvanloc1247@gmail.com" }
  def notification
    @contact = params[:contact]
    mail(to: 'minhduyen0608@gmail.com', subject: 'Thông tin Khách hàng cần liên hệ')
  end
end
