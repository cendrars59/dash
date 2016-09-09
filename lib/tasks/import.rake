# Purpose is to manage the import of different kin d of file

namespace :import do



  desc "Import log types from CSV"
  # thnks to :environment usage can get access to models, and in fact,
  # the whole environment by making tasks dependent on the environment task
  task log_types: :environment do
    # File.join Returns a new string formed by joining the strings using File::SEPARATOR.
    # File.join("usr", "mail", "gumby")   #=> "usr/mail/gumby"


    filename = File.join Rails.root, "logtypeimport.csv"


    count = 0
    count_valid = 0
    reportfilename = "Report on log_types #{Time.now}"
    reportfile = File.new(reportfilename, "w+")

    CSV.foreach(filename, headers: true, headers_converters: :symbol) do |row|
      count += 1
      logtype = LogType.new row.to_hash.slice(:code,:label,:description)
      code, label, description = row
      log_type = LogType.create(code: code, label: label, description: description)
      reportfile.puts "Error row #{count}" if log_type.errors.any?
      count_valid += 1 if log_type.persisted?
    end

    reportfile.puts "Import completed at #{Time.now}"
    reportfile.puts "Imported #{count_valid} logtype(s) on #{count} line(s)"

  end

end
