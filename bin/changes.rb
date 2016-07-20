require "optparse"

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: changes.rb [options]"
end.parse!
