require File.expand_path(File.dirname(__FILE__) + "/environment")
require 'active_support/core_ext/time'

set :environment, Rails.env.to_sym
env :PATH, ENV['PATH']
set :output, environment == 'development' ? 'log/crontab.log' : '/var/www/bager/shared/log/crontab.log'
set :job_template, "/bin/bash -l -c ':job'"
job_type :runner, "cd :path && bundle exec rails runner -e :environment ':task' :output"
job_type :rake, 'export PATH="$HOME/.rbenv/bin:$PATH"; eval "$(rbenv init -)"; cd :path && RAILS_ENV=:environment bundle exec rake :task :output'

def local(time)
  Time.zone = 'Asia/Tokyo'
  Time.zone.parse(time).localtime($system_utc_offset)
end

every :day, at: local('0:00 am') do
  runner "Reserve.date_check"
end

every :day, at: local('5:00 am') do
  runner "User.count_reset"
end

every :month, at: local('4:59 am') do
  runner "User.stop_down"
end

# cron check
every 1.minutes do
runner "User.count_reset"
end

# every 1.minutes do
# rake "tweet:text"
# end

# 実行： bundle exec whenever  --update-crontab
# 停止： bundle exec whenever  --clear-crontab
# 確認： crontab -l
# 確認(本番環境): RAILS_ENV=production crontab  -l