class User
  attr_accessor :name, :score
  
  def initialize
    @name = get_name
    @score = 0
  end
  
  def get_name
    puts "Hi! What's your name?"
    gets.chomp
  end
  
end