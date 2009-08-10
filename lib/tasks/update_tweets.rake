  desc 'Update tweets from Twitter'
  task :update_tweets => :environment do
    
    require 'rubygems' 
    gem 'twitter'
    require 'twitter'
      
      
    max_tweets = 5  
      
      Contact.find(:all).each do |c|
        
        #get last 5 tweets:
        
        
        if c.twitter_name && c.twitter_name != ""
          puts "\n---- Tweets for #{c.name} : #{c.twitter_name} ----"
          
          search = Twitter::Search.new.from(c.twitter_name)
          
          tweets_text = []
          if search 
            i = 0
            search.each do |r|
              tweets_text.push [r.text,r.created_at]
              break if i==5
              i+=1
            end
            
            
            #puts search.inspect

            if tweets_text.length > 0
              #clean out old tweets
              Tweet.delete_all(["contact_id = ?",c.id])              
              tweets_text[1..max_tweets].each do |t| 
                puts "#{t[0]} [#{t[1]}]\n"
                Tweet.create(:contact_id => c.id, :text => t[0], :created_at => DateTime.parse(t[1]))
              end
            end
          end
          
        end
      end

   end
