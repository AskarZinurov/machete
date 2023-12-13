namespace :statistics do
  desc "Clear and compact visit statistics"
  task compact: :environment do
    Link.find_each do |link|
      Services::StatisticsCleaner.run(link:)
    end
  end
end
