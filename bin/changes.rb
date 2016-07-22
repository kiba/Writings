require "optparse"
require "date"

directories = ["for_science","atg"]

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: changes.rb [options]"
  opts.on("-t", "--today", "Sum up today's changes compared to last available report.") do |a|
    options[:all] = a
  end

  opts.on("-h", "--help", "Print all commands.") do
    puts opts
  end
end.parse!

p options
p ARGV
