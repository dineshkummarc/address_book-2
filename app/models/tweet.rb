class Tweet < ActiveRecord::Base

  hobo_model # Don't put anything above this
  
#  require 'rubygems'
#  require TLD 

  fields do
    text       :string
    contact_id :integer
    timestamps
  end

  belongs_to :contact
  
  ### Could not get gem tld to load! :(
  def text_parse_links
    text.gsub(/((\w+\.){1,3}\w+\/\w+[^\s]+)/) {|x| is_tld?(x) ? "<a href='http://#{x}'>#{x}</a>" : x}
  end

  def is_tld?(base_uri)
    begin
      TLD.find(base_uri)
      return true
    rescue
      return false
    end
  end


  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
