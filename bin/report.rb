directories = ["for_science","atg"]

def generateDir dir
  if Dir.exist?("reports/" + dir) == false
    puts "directory does not exists"
  end
end
