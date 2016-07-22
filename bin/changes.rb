require "optparse"
require "date"

directories = ["for_science","atg"]

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: changes.rb [options]"
  opts.on("-t", "--today", "Sum up today's changes compared to last available report.") do |t|
    options[:all] = t
  end

  opts.on("-h", "--help", "Print all commands.") do
    puts opts
  end
end.parse!

if options[:all] == true
  today = Date.today
  status = File.exist?("reports/for_science/" + today.to_s + ".md")
  puts status
end
