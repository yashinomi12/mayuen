class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    render :action =>'index'
  end

  def confirm
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      render :action => 'confirm'
    else
      render :action =>'index'
    end
  end

  def thanks
    @contact = Contact.new(params[:contact])
    ContactMailer.received_email(@contact).deliver

    render :action => 'thanks'
  end
end
