class Api::ContactsController < ApplicationController

  def index
    @contacts = Contact.all
    
    if params[:search]
      @contacts = @contacts.where("first_name ILIKE ?", "%#{params[:search]}%")
    end
    
    render "index.json.jb"
  end

  def show
    @contact = Contact.find_by(id: params[:id])
    render "show.json.jb"
  end

  def create
    @contact = Contact.new(
      first_name: params[:first_name],
      middle_name: params[:middle_name],
      last_name: params[:last_name],
      phone_number: params[:phone_number],
      email: params[:email],
      bio: params[:bio],
      )
    @contact.save
    render "show.json.jb"
  end

  def update
    @contact = Contact.find_by(id: params[:id])
    @contact.first_name = params[:first_name] || contact.first_name
    @contact.middle_name = params[:middle_name] || contact.middle_name
    @contact.last_name = params[:last_name] || contact.last_name
    @contact.email = params[:email] || contact.email
    @contact.phone_number = params[:phone_number] || contact.phone_number
    @contact.bio = params[:bio] || contact.bio
    contact.save
    render "show.json.jb"
  end

  def destroy
    @contact = Contact.find_by(id: params[:id])
    @contact.destroy
    render json: {message: "Please press F."}
  end

end
