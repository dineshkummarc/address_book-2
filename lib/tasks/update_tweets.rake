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
          
          tweets_text = []
          if search 
            search.each do |r|
              tweets_text.push [r.text,r.created_at]
            end
            
            
            #puts search.inspect
            
            old_tweets = Tweet.find_all_by_contact_id(c.id) 
            if old_tweets.empty? 
              if tweets_text.length > 0
                tweets_text[1..max_tweets].each do |t| 
                  puts "#{t}\n"
                  Tweet.create(:contact_id => c.id, :text => t[0], :created_at => DateTime.parse(t[1]))
    
                end
              end
            else
              i = 0
              old_tweets[1..max_tweets].each do |t|
                puts "#{tweets_text[i][0]}\n"
                t.update_attributes({:text => tweets_text[i][0], :created_at => DateTime.parse(tweets_text[i][1]) })
                i+=1
              end
            end
          end
          
        end
      end

   end
