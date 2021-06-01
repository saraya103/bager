require File.expand_path(File.dirname(__FILE__) + "/environment")

set :environment, Rails.env.to_sym
env :PATH, ENV['PATH']
set :output, "#{Rails.root.to_s}/log/cron.log"
set :job_template, "/bin/bash -l -c ':job'"
job_type :runner, "cd :path && bundle exec rails runner -e :environment ':task' :output"

every :day, at: "0:00 am" do
  runner "Reserve.date_check"
end

every :day, at: "5:00 am" do
  runner "User.count_reset"
end

every :month, at: "4:59 am" do
  runner "User.stop_down"
end

# every 1.minutes do
# rake "tweet:text"
# end

# 実行： bundle exec whenever  --update-crontab
# 停止： bundle exec whenever  --clear-crontab
# 確認： crontab -l