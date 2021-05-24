namespace :tweet do

  desc "テスト..."
  task :text => :environment do
    logger = Logger.new 'log/test.log'
    p "ここまでOK"
  end

end