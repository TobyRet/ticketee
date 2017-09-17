require 'csv'

namespace :import do
  desc "Import the csv"
  task csv: :environment do
    CSV.foreach('random.csv', headers: true) do |row|
      p row
      p row['name']
    end
  end
end


