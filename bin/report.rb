directories = ["for_science","atg"]

def generate_dir dir
  if Dir.exist?("reports/" + dir) == false
    puts "directory does not exists. Generating directory: " + dir
    Dir.mkdir("reports/" + dir)
  end
end

def list_files dir
  Dir[dir]
  Dir.glob(dir + "/chp*.md")
end
