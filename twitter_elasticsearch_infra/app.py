import json
from tweepy.streaming import StreamListener
from tweepy import OAuthHandler
from tweepy import Stream
from textblob import TextBlob
from elasticsearch import Elasticsearch
import yaml
import os

# import twitter keys and tokens
with open('.creds.yml') as f:
    config = yaml.load(f)

consumer_key = config['twitter']['consumer_key']
consumer_secret = config['twitter']['consumer_secret']
access_token = config['twitter']['access_token']
access_token_secret = config['twitter']['access_token_secret']

# create instance of elasticsearch
es = Elasticsearch()

class TweetStreamListener(StreamListener):
    # on success
    def on_data(self, data):
        # decode json
        dict_data = json.loads(data)
        # pass tweet into TextBlob
        tweet = TextBlob(dict_data["text"])
        # output sentiment polarity
        print (tweet.sentiment.polarity)
        # add text and sentiment info to elasticsearch
        es.index(index="sentiment",
                 doc_type="test-type",
                 body={"author": dict_data["user"]["screen_name"],
                       "date": dict_data["created_at"],
                       "message": dict_data["text"],
                       "polarity": tweet.sentiment.polarity,
                       "subjectivity": tweet.sentiment.subjectivity,
                       "sentiment": 'sentiment'})
        return True
    # on failure
    def on_error(self, status):
        print status

if __name__ == '__main__':
    # create instance of the tweepy tweet stream listener
    listener = TweetStreamListener()
    # set twitter keys/tokens
    auth = OAuthHandler(consumer_key, consumer_secret)
    auth.set_access_token(access_token, access_token_secret)
    # create instance of the tweepy stream
    stream = Stream(auth, listener)
    # search twitter for "congress" keyword
    stream.filter(track=['congress'])
