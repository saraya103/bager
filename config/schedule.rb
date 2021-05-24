require File.expand_path(File.dirname(__FILE__) + "/environment")

set :environment, Rails.env.to_sym
env :PATH, ENV['PATH']
set :output, "#{Rails.root.to_s}/log/cron.log"
set :job_template, "/bin/bash -l -c ':job'"
job_type :runner, "cd :path && bundle exec rails runner -e :environment ':task' :output"

every :day, at: "0:00 am" do
  runner "Reserve.date_check"
end

# rake "tweet:text"