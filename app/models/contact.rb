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


#    def changing_password?
#      !new_record? && !lifecycle_changing_twitter_password? &&
#        (current_password.present? || password.present? || password_confirmation.present?)
#    end  

end

#def Hobo.find_by_search(query, search_targets=nil, current_user=nil)
# 
#  
#  search_targets ||= EntityModule.all_entity_models(iterations)
#    
#  RAILS_DEFAULT_LOGGER.debug "CUSTOM find_by_search"
#  
#  query_words = ActiveRecord::Base.connection.quote_string(query).split
#  
#  search_targets.build_hash do |search_target|
#    conditions = []
#    parameters = []
#    query_words.each do |word|
#      
#      column_queries = search_target.search_columns.map { |column| "#{column} like ?" }
#      conditions << "(" + column_queries.join(" or ") + ")"
#      parameters.concat(["%#{word}%"] * column_queries.length)
#    end
#    
#    conditions = conditions.flatten.join(" and ")
#    
#    test = search_target.new # hack to get methods..
#    conditions << "#{' and' if query_words.length>0} project_id = #{current_user.project_id}" if current_user && test.respond_to?( :project_id )
#    conditions << " and organisation_id = #{current_user.organisation_id}"  if current_user && test.respond_to?( :organisation_id )
#    conditions << " and iteration_id IS NOT NULL" if iterations==true
#    conditions << " and iteration_id IS NULL" if iterations==false    
#    conditions << " and deleted_at IS NULL" if test.respond_to? 'deleted_at'
#    conditions << " and #{extra_conditions}" if extra_conditions 
#    
#    RAILS_DEFAULT_LOGGER.info filters.inspect
#    
#    user_card = nil
#    
#    if filters 
#      RAILS_DEFAULT_LOGGER.info filters.inspect
#      filters.each do |key,value|
#      
#        name = key.gsub('filter_','')
#        
#        if name == 'user_cards'
#          
#          #FROM Authors
#          
#          #INNER JOIN AuthorsBooks ON Authors.AuthorID = AuthorsBooks.AuthorID
#          #INNER JOIN Books ON AuthorsBooks.BookID = Books.BookID
#          
#          user_card = value         
#
#          #conditions << " and (INNER JOIN user_cards uc ON users.id = uc.user_id)"
#        else
#          conditions << " and #{name+'_id'} = #{value}"
#        end
#      end
#    end
#    
#    RAILS_DEFAULT_LOGGER.info "conditions: "+conditions
#
#    results = search_target.find(:all, :conditions => [conditions, *parameters])
#    
#    #cheating - should really work out the inner join...
#    if user_card
#      user_id = user_card.to_i
#      results = results.select do |r|
#        user_ids = r.user_cards.map { |uc| uc.user_id }
#        
#        RAILS_DEFAULT_LOGGER.info "?? is #{user_id.inspect} in #{user_ids.inspect}? :#{'YES' if user_ids.index(user_id)}" unless user_ids.empty?
#        
#        user_ids.index(user_id)
#      end
#    end
#    
#    if( search_targets.length == 1) 
#      current_sorting = UserEntitySortState.find_by_user_id_and_project_id_and_entity_type(
#            current_user.id, current_user.project_id, search_targets[0].class.name)      
#        
#      results.sort!      
#      if current_sorting && !current_sorting.direction
#        results.reverse!
#      end
#    end
#    
#    [search_target.name, results] unless results.empty?
#  end
#end
