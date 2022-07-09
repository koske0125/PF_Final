class Public::ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    if @contact.invalid?
      render "new"
    end
  end

  def back
    @contact = Contact.new(contact_params)
    render "new"
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to public_path, success: "送信しました"
    else
      render "new"
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name,:email,:subject,:message)
  end

end
