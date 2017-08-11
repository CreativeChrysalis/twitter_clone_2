module TweetsHelper

def get_tagged(tweet)

      message_arr = tweet.message.split

      message_arr.each_with_index do |word, index|
        if word[0] == "#"
            if Tag.pluck(:phrase).include?(word)
               tag = Tag.find_by(phrase: word)
            #save that Tag as a variable (to use in TweetTag creation)
          else
            tag = Tag.create(phrase: word)
            #create a new instance of Tag
          end
           tweet_tag = TweetTag.create(tweet_id: tweet.id, tag_id: tag.id)
          #create a new instance of a Tag
          message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
        end
      end


      tweet.message = message_arr.join(" ")
      return tweet
    end
end
