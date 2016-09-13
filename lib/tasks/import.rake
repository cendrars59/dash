# Purpose is to manage the import of the master data thanks to different tasks
# created to import different kind of master data

namespace :import do

  #Req-Import-001 : Importing the log types
  #Description : Feature to import from CSV file the log status as master data

  desc "Import log types from CSV"
  # thnks to :environment usage can get access to models, and in fact,
  # the whole environment by making tasks dependent on the environment task
  task log_types: :environment do

    # File.join Returns a new string formed by joining the strings using File::SEPARATOR.
    # File.join("usr", "mail", "gumby")   #=> "usr/mail/gumby"
    filename = File.join Rails.root, "log_types.csv"
    count = 0
    count_valid = 0
    reportfilename = "Report on log_types #{Time.now}"
    reportfile = File.new(reportfilename, "w+")

    CSV.foreach(filename, headers: true, headers_converters: :symbol) do |row|
      count += 1
      logtype = LogType.new row.to_hash.slice(:code,:label,:description)
      code, label, description, active = row
      log_type = LogType.create(code: code, label: label, description: description)
      reportfile.puts "Error row #{count} : #{row}" if log_type.errors.any?
      count_valid += 1 if log_type.persisted?
    end

    reportfile.puts "Import completed at #{Time.now}"
    reportfile.puts "Imported #{count_valid} log type(s) on #{count} line(s)"

  end



  #Req-Import-002 : Importing the log status
  #Description : Feature to import from CSV file the log types as master data

  desc "Import log status from CSV"
  task log_status: :environment do

    filename = File.join Rails.root, "log_status.csv"
    count = 0
    count_valid = 0
    reportfilename = "Report on log_status #{Time.now}"
    reportfile = File.new(reportfilename, "w+")

    CSV.foreach(filename, headers: true, headers_converters: :symbol) do |row|
      count += 1
      log_status = LogStatus.new row.to_hash.slice(:code,:label,:description,:active)
      code, label, description, active = row
      log_status = LogStatus.create(code: code, label: label, description: description, active: active)
      reportfile.puts "Error row #{count} : #{row}" if log_status.errors.any?
      count_valid += 1 if log_status.persisted?
    end

    reportfile.puts "Import completed at #{Time.now}"
    reportfile.puts "Imported #{count_valid} log status on #{count} line(s)"

  end


  #Req-Import-003 : Importing the log stages
  #Description : Import feature to import from CSV file the log stages as master data

  desc "Import log stages from CSV"
  task log_stages: :environment do

    filename = File.join Rails.root, "log_stages.csv"
    count = 0
    count_valid = 0
    reportfilename = "Report on log stages #{Time.now}"
    reportfile = File.new(reportfilename, "w+")

    CSV.foreach(filename, headers: true, headers_converters: :symbol) do |row|
      count += 1
      log_stage = LogStage.new row.to_hash.slice(:code,:label,:description,:active)
      code, label, description, active = row
      log_stage = LogStage.create(code: code, label: label, description: description, active: active)
      reportfile.puts "Error row #{count} : #{row}" if log_stage.errors.any?
      count_valid += 1 if log_stage.persisted?
    end

    reportfile.puts "Import completed at #{Time.now}"
    reportfile.puts "Imported #{count_valid} log stages on #{count} line(s)"

  end


  #Req-Import-004: Importing the log milestones
  #Description : Import feature to import from CSV file the log milestones as master data

  desc "Import log milestones from CSV"
  task log_milestones: :environment do

    filename = File.join Rails.root, "log_milesstones.csv"
    count = 0
    count_valid = 0
    reportfilename = "Report on log milestones #{Time.now}"
    reportfile = File.new(reportfilename, "w+")

    CSV.foreach(filename, headers: true, headers_converters: :symbol) do |row|
      count += 1
      log_milestone = Milestone.new row.to_hash.slice(:code,:label,:description,:active)
      code, label, description, active = row
      log_milestone = Milestone.create(code: code, label: label, description: description, active: active)
      reportfile.puts "Error row #{count} : #{row}" if log_milestone.errors.any?
      count_valid += 1 if log_milestone.persisted?
    end

    reportfile.puts "Import completed at #{Time.now}"
    reportfile.puts "Imported #{count_valid} log milesstones on #{count} line(s)"

  end


end
