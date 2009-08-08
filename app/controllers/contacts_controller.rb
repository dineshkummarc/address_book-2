class ContactsController < ApplicationController

  hobo_model_controller

  auto_actions :all
  
  protect_from_forgery :except => [:index, :autocomplete_search]


#  autocomplete :contact_search do
#    contact = find_instance
#    hobo_completions :name, Contact
#  end
#  

  def autocomplete_search
    results = Contact.find_with_ferret(params[:query])
    render :text => call_tag(:autocomplete_search, {:with => results})
  end

#
  def index
    # return everything if no search parameter
    query = params[:search].blank? ? '*' : params[:search]
    @contacts = Contact.paginate_search(
          query, 
          {:page => (params[:page] or 1), 
          :per_page => 10 } )  # you can also past an additional hash with finder options if needed
    @contacts.member_class = Contact # allows hobo index page to work as is
  end

end
