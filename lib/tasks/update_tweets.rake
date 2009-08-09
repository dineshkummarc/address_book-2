  desc 'Update tweets from Twitter'
  task :update_tweets => :environment do
    
    require 'rubygems' 
    gem 'twitter'
    require 'twitter'
      
      
    max_tweets = 5  
      
      Contact.find(:all).each do |c|
        
        #get last 5 tweets:
        
        
        if c.twitter_name && c.twitter_name != ""
          puts "Tweets for #{c.name} : #{c.twitter_name}"
          
          search = Twitter::Search.new.from(c.twitter_name)
          
          tweets = []
          if search 
            search.each do |r|
              tweets << r.text
            end
            
            
            puts search.inspect
            
            old_tweets = Tweet.find_all_by_contact_id(c.id) 
            if old_tweets.empty? 
              if tweets.length > 0
                tweets[1..max_tweets].each do |t| 
                  puts "#{t}\n"
                  Tweet.create(:contact_id => c.id, :text => t)
    
                end
              end
            else
              i = 0
              old_tweets[1..max_tweets].each do |t|
                t.update_attribute(:text, tweets[i])
                i+=1
              end
            end
          end
          
        end
      end

   end
