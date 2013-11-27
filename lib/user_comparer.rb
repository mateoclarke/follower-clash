require 'rubygems'
require 'bundler/setup'
require 'twitter'

module UserComparer
  class User

  	attr_reader :username
  	def initialize(username)
  		@username = username
  		@client = Twitter::REST::Client.new do |config|
  		  config.consumer_key        = ENV['CONSUMER_KEY']
  		  config.consumer_secret     = ENV['CONSUMER_SECRET']
  		  config.access_token         = ENV['OAUTH_TOKEN']
  		  config.access_token_secret  = ENV['OAUTH_TOKEN_SECRET']
  		 end 
  	end

  	def followers
			@client.user(@username).followers_count 	
  	end

  	def friends
			@client.user(@username).friends_count 	
  	end

  	def tweets
			@client.user(@username).statuses_count 	
  	end

  	def last_tweet
  		@client.user(@username).status.text
  	end  	

  	def created
  		@client.user(@username).created_at
  	end

  end

  class Comparer

		def initialize(user1, user2)
			@user1 = user1
			@user2 = user2
		end

		def compare
			if (@user1.followers > @user2.followers)
				return @user1.username
			elsif (@user2.followers > @user1.followers)
				return @user2.username
			else 
				return "They are equal."
			end
		end

		def friend_compare
			if (@user1.friends > @user2.friends)
				return @user1.username
			elsif (@user2.friends > @user1.friends)
				return @user2.username
			else 
				return "They are equal."
			end
		end

		def tweets_compare
			if (@user1.tweets > @user2.tweets)
				return @user1.username
			elsif (@user2.tweets > @user1.tweets)
				return @user2.username
			else 
				return "They are equal."
			end
		end
	
		def last_tweet_compare
			if (@user1.last_tweet > @user2.last_tweet)
				return @user1.username
			elsif (@user2.last_tweet > @user1.last_tweet)
				return @user2.username
			else 
				return "They are equal."
			end
		end

		def created_compare
			if (@user1.created < @user2.created)
				return "#{@user1.username} joined twitter first"
			elsif (@user1.created > @user2.created)
				return "#{@user2.username} joined twitter first"
			else 
				return "They joined at the exact same moment."
			end
		end
	end  


end