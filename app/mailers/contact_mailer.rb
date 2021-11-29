class ContactMailer < ApplicationMailer

	default :from => "\"Ms.Duyen Toyota Gò Vấp\" <no-reply@toyotagovap.vn>",
          reply_to: -> { "nguyenvanloc1247@gmail.com" }
  def notification
    @contact = params[:contact]
    mail(to: 'nguyenvanloc1247@gmail.com', subject: 'Thông tin Khách hàng cần liên hệ',
      cc: 'nguyenvanloc1247@gmail.com')
  end
end
