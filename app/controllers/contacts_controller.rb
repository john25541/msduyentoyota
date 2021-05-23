class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.with(contact: @contact).notification.deliver_now
        format.html {redirect_to root_path, notice: "oke ! good job"}
        format.json {}
      else 
        format.html {render :index}
        format.json {render json: @contact.errors, status: :unprocessable_entity}
      end
    end
  end

  private ##

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :message, :email)
  end
end
