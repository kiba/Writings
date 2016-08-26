require "json"

class Dice
  def initialize
    @info = JSON.parse(File.read("info.json"))
  end
end
