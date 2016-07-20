require "date"


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
  words
end

count_words(list_chapters("for_science"))

directories = ["for_science","atg"]

directories.each do |d|
  words = count_words(list_chapters(d))
  today = Date.today()
  filename = "reports/" + d + "/" + today.strftime("%Y-%m-%d") + ".md"
  File.open(filename, "w") {|f|
    f.write(words.to_s + " total")
  }
end
