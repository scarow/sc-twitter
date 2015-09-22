# sc-twitter

## Brief walkthrough of app design / choices made

### Authentication

- I used the devise gem for authentication, since it's one of the most popular auth gems. It is also really easy to set up and has great documentation.

### Caching

- I added tweet caching using Rails' low-level caching, as there's no need to store API responses in my DB (for now). API responses are commonly cached this way in Rails.

### Styling

- I decided to use bootstrap for styling. I would likely never use bootstrap other than for prototyping, since it is a bulky library, but it is extremely useful for getting an app to look good in a short period of time.
- I put most of my CSS inline for now, though I separated out some more complex css (i.e box shadows) because it's a bit bulky to be inline. The badges next to each tweet are RTs and Favorites (hover to see tooltips)

### UX/UI choices

For the user flow of the app, I didn't want the user to have to click tons of buttons to navigate around; I thought it would be best to populate the tweets on the same page as the form. This way, users don't have to submit the request, get directed to a new page with tweets, and then click 'Back' to do another search. Instead, it's all there on the same page. I probably could have done this with AJAX, but routes are more 'rails-y', and are more intuitive for rails developers. One limitation is that after you do one search, you get the home/get_tweets route in your URL, so it asks about a form submit when you manually refresh the page. There is probably a way to work around this, though.

## Local environment setup instructions
- run `rake db:setup`
- run `rake db:migrate`

## Basic Heroku deployment instructions
- Install the heroku toolbelt
- run `heroku login`
- run `heroku create sc-twitter`
- run `bundle exec rake assets:precompile` (not always necessary; only when you've changed assets like css)
- run `git push heroku master`
- run `heroku run rake db:migrate`
- run `heroku config:set TWITTER_CONSUMER_KEY='your_twitter_consumer_key' TWITTER_CONSUMER_SECRET='your_twitter_consumer_secret' TWITTER_ACCESS_TOKEN='your_twitter_access_token' TWITTER_ACCESS_TOKEN_SECRET='your_twitter_access_token_secret'`

## Test suite setup/execution instructions (if applicable)