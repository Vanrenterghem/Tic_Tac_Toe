class Player

  @@player_instance = 0
  @@instance_collector = []

  attr_accessor :player_name
  attr_accessor :winning
  attr_accessor :symbol

  def initialize(winning = false, symbol)
    @@player_instance += 1
    @winning = winning
    @symbol = symbol
    @player_name = asking_names
    @@instance_collector << self
  end

#This method asks the name of each players
  def asking_names
    puts "\n-------------------------------------------------------"
    puts "What is the name of Player #{@@player_instance} ?"
    player_name = gets.chomp
    return player_name
  end
#This method return the instances of Player
  def self.offsprings
    @@instance_collector
  end
end


