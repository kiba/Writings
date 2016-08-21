#!/usr/bin/env ruby

require "optparse"
require "date"
require "json"
require "./bin/report.rb"
info = JSON.parse(File.read("info.json"))

options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: changes.rb [options]"
  opts.on("-dDir", "--directory=DIRECTORY", "Choose specific project to summarize") do |d|
    options[:directory] = d
  end

  opts.on("-h", "--help", "Print all commands.") do
    puts opts
    exit
  end
end.parse!

def changes options, info
  generate_report(info["primary"])
  today = Date.today
  filename = "reports/" + info["primary"] + "/" + today.to_s + ".md"
  if File.exist?(filename)
    if options[:directory].nil?
      dir = "reports/" + info["primary"]
    else
      dir = "reports/" + options[:directory]
    end
    Dir[dir]
    reports = Dir.glob(dir + "/*.md")
    todayFile = File.read(reports[-1]).split(" ")
    lastAvailable = File.read(reports[-2]).split(" ")
    changes = todayFile[0].to_i - lastAvailable[0].to_i
    puts "Total changes:" + changes.to_s
    if changes >= info["goal"]
      puts "Success! Met goal of " + info["goal"].to_s
    else
      need = info["goal"] - changes
      puts "You need " + need.to_s + " more words"
    end
    puts "Last Available Report: " + lastAvailable[0] + ", Today's Report: " + todayFile[0]
  else
    puts "Error: today's report haven't been generated."
  end
end

changes(options,info)
