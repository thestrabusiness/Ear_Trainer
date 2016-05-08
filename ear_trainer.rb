
# Ear training app to acclimating your ears to tones across all 10 octaves of human hearing.
# 32Hz, 64 Hz, 125Hz, 250hz, 500Hz, 1kHz, 2kHz, 4kHz, 8kHz, 16kHz

require 'win32/sound'
require_relative 'tone_test'
require_relative 'fidelity_test'
include Win32

def scoreboard
  puts "The user scores will be shown here"
  sleep 5
end

def get_input
  gets.chomp.to_i
end
  

option = 0 
while option != 4 do
  puts "Choose from options 1-4 below: "
  puts " 1. Tone test"
  puts " 2. Lossy vs Lossless test"
  puts " 3. Scoreboard"
  puts " 4. Exit"
  option = get_input
  case option
    when 1
      ToneTest.new
    when 2
      FidelityTest.new
    when 3
      scoreboard
    when 4
      exit
    else
      puts "That's not a valid choice."
  end
end  