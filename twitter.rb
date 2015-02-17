require 'twitter'

# See: http://www.rubydoc.info/gems/twitter
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = "key1"
  config.consumer_secret     = "key2"
end

#print question for user and get answer
def ask_twitterkeyword
	puts "Tell me a keyowrd you would like to know more on twitter!"
	gets.chomp.downcase
end

class TwitterSearch  
  def initialize(twitter_search_keyword, client) 
    @twitter_search_keyword = twitter_search_keyword   
	@client = client
  end  
  
	#get last tweet for given twitter search query
	def last_tweet
		result = @client.search(@twitter_search_keyword)
		result.first.full_text
	end
end

puts TwitterSearch.new(ask_twitterkeyword, client).last_tweet

=begin
tweet_corrector = TweetCorrector.new(client)

# get twitter user name
tweet_corrector.set_user

# find latest tweet
tweet = tweet_corrector.find_last_tweet

puts tweet # Should print tweetq12
=end