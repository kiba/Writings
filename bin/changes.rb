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
    n = 0
    reports.each do |report|
      n += 1
    end
    puts "file exists."
  else
    puts "Error: today's report haven't been generated."
  end
end