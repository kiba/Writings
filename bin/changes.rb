require "optparse"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: changes.rb [options]"
  opts.on("-a", "--all", "Sum up all changes") do |a|
    options[:all] = a
  end
end.parse!

p options
p ARGV
