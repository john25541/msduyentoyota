class ContactsController < ApplicationController

  def index
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        ContactMailer.with(contact: @contact).notification.deliver_now
        format.html {redirect_to contacts_path}
        flash[:success] = true
        format.js {}
      else
        format.html {render :index}
        format.json {render json: @contact.errors, status: :unprocessable_entity}
        format.js   {}

        @error_name = []
        @error_phone = []
        @error_message = []

        @error_name.push(@contact.errors["name"][0]) if (@contact.errors["name"] != nil)
        @error_phone.push(@contact.errors["phone_number"][0]) if (@contact.errors["phone_number"] != nil)
        @error_message.push(@contact.errors["message"][0]) if (@contact.errors["message"] != nil)
      end
    end
  end

  private ##

  def contact_params
    params.require(:contact).permit(:name, :phone_number, :message, :email, :product)
  end
end
