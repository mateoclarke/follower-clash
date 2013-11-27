require 'rubygems'
require 'bundler/setup'

require_relative 'lib/user_comparer'

user1 = UserComparer::User.new('mateoclarke')
user2 = UserComparer::User.new('clam_stew')
puts "#{user1.username}'s follower count: #{user1.followers}"
puts "#{user2.username}'s follower count: #{user2.followers}"

comparer = UserComparer::Comparer.new(user1, user2)
puts "And the user with the most followers is: #{comparer.compare}"

puts "#{user1.username}'s friend count: #{user1.friends}"
puts "#{user2.username}'s friend count: #{user2.friends}"
friends = UserComparer::Comparer.new(user1, user2)
puts "And the user with the most friends is: #{friends.friend_compare}"

puts "#{user1.username}'s tweet count: #{user1.tweets}"
puts "#{user2.username}'s tweet count: #{user2.tweets}"
friends = UserComparer::Comparer.new(user1, user2)
puts "And the user with the most tweets is: #{friends.tweets_compare}"

puts "#{user1.username}'s last tweet: #{user1.last_tweet}"
puts "#{user2.username}'s last tweet: #{user2.last_tweet}"
friends = UserComparer::Comparer.new(user1, user2)

puts "#{user1.username}'s twitter handle was created: #{user1.created}"
puts "#{user2.username}'s twitter handle was created: #{user2.created}"
friends = UserComparer::Comparer.new(user1, user2)
puts "The user with the oldest tweeter account is: #{friends.created_compare}"

