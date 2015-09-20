# sc-twitter

## Brief walkthrough of app design / choices made
## Local environment setup instructions
- run `rake db:setup`
- run `rake db:migrate`
## Basic Heroku deployment instructions
- Install the heroku toolbelt
- run `heroku login`
- run `heroku create sc-twitter`
- run `git push heroku master`
- run `heroku run rake db:migrate`
- run `heroku config:set TWITTER_CONSUMER_KEY='your_twitter_consumer_key' TWITTER_CONSUMER_SECRET='your_twitter_consumer_secret' TWITTER_ACCESS_TOKEN='your_twitter_access_token' TWITTER_ACCESS_TOKEN_SECRET='your_twitter_access_token_secret'`

## Test suite setup/execution instructions (if applicable)