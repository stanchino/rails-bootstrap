web: bundle exec rake db:migrate && bundle exec unicorn -p $PORT --config-file ./config/unicorn.rb --no-default-middleware
rails: tail -f log/*.log
