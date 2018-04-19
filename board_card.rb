class Board_card

  attr_accessor :status

  @@instance = 0
  @@children = []
  def initialize(status ="")
    @status = status
    @@instance +=1
    @@children << self
  end

  def self.children
    @@children
  end
end


#Not much here, just a board_card class that define
#The instances parameters

