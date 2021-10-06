class Admins::ContactsController < Admins::AdminsController

  def index
    @admins_conacts = Contact.all
  end

  def show
    @admins_conact = Contact.find(params[:id])
  end

end