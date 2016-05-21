
# Ear training app to acclimating your ears to tones across all 10 octaves of human hearing.
# 32Hz, 64 Hz, 125Hz, 250hz, 500Hz, 1kHz, 2kHz, 4kHz, 8kHz, 16kHz

require 'win32/sound'
require_relative 'tone_test'
require_relative 'fidelity_test'
require_relative 'user'
include Win32

class EarTrainer
  
  attr_accessor :user, :option, :score
  
  def initialize
    system "cls"
    @user = User.new
    @option = 0
    
    show_menu
  end
    
  def scoreboard
    puts "The user scores will be shown here"
    sleep 5
  end

  def show_menu
    while @option != 4 do
      system "cls"
      puts "Hi, #{@user.name}! Choose from options 1-4 below: "
      puts " 1. Tone test"
      puts " 2. Lossy vs Lossless test"
      puts " 3. Scoreboard"
      puts " 4. Exit"
      @option = gets.to_i
      case @option
        when 1
          ToneTest.new(@user)
        when 2
          FidelityTest.new(@user)
        when 3
          scoreboard
        when 4
          exit
        else
          puts "That's not a valid choice."
      end
    end
  end
    
end

EarTrainer.new