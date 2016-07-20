directories = ["for_science","atg"]

def generate_dir dir
  if Dir.exist?("reports/" + dir) == false
    puts "directory does not exists. Generating directory: " + dir
    Dir.mkdir("reports/" + dir)
  end
end

def list_chapters dir
  Dir[dir]
  Dir.glob(dir + "/chp*.md")
end

def count_words files
  words = 0
  files.each do |f|
    content = File.open(f,"r") do |content|
      content.read()
    end
    words += content.split(" ").size()
  end
  puts words
end

count_words(list_chapters("for_science"))
