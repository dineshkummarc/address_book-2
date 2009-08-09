class Contact < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    first_name               :string
    last_name                :string
    email_address            :string
    phone_number             :string
    image_file_name          :string
    image_content_type       :string
    image_file_size          :string
    twitter_name             :string
    crypted_twitter_password :string
    twitter_salt             :string
    timestamps
  end
  
  before_save :encrypt_twitter_password
  
  has_many :tweets
  
  # Virtual attributes for setting and changing the password
  attr_accessor :twitter_password, :type => :password  
  never_show :twitter_salt, :crypted_twitter_password
  attr_protected :twitter_salt, :crypted_twitter_password  
  
  has_attached_file :image, :styles => { :medium => "200x200>", :thumb => "50x50>" }
  acts_as_ferret :fields => [:first_name, :last_name, :name, :twitter_name, :email_address]
  
  def name
    "#{first_name} #{last_name}"
  end
  
  # Encrypts the twitter_password with the salt
  def encrypt(twitter_password)

    User.encrypt(twitter_password, twitter_salt)

  end  
 
  
  module ClassMethods

    def encrypt(password)
      self.class.encrypt(password, salt)
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
  
  
    protected
    # Before filter that encrypts the password before having it stored in the database.
    def encrypt_twitter_password
      return if twitter_password.blank?
      self.twitter_salt = Digest::SHA1.hexdigest("--#{Time.now.to_s}--#{email_address}--") if twitter_salt.blank?
      self.crypted_twitter_password = encrypt(twitter_password)
    end

end
