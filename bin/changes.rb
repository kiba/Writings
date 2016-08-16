require "optparse"
require "date"

directories = ["for_science","atg"]

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: changes.rb [options]"
  opts.on("-t", "--today", "Sum up today's changes compared to last available report.") do |t|
    options[:today] = t
  end

  opts.on("-h", "--help", "Print all commands.") do
    puts opts
  end
end.parse!

if options[:today] == true
  today = Date.today
  filename = "reports/for_science/" + today.to_s + ".md"
  if File.exist?(filename)
    dir = "reports/for_science"
    Dir[dir]
    reports = Dir.glob(dir + "/*.md")
    todayFile = File.read(reports[-1]).split(" ")
    lastAvailable = File.read(reports[-2]).split(" ")
    changes = todayFile[0].to_i - lastAvailable[0].to_i
    puts "Total changes:" + changes.to_s
    puts "Last Available Report: " + lastAvailable[0] + ", Today's Report: " + todayFile[0]
  else
    puts "Error: today's report haven't been generated."
  end
end
