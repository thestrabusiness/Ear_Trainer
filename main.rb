
# Ear training app to acclimating your ears to
# tones across all 10 octaves of human hearing.

require 'win32/sound'
require_relative 'tone_test'
require_relative 'tone_training'
require_relative 'fidelity_test'
require_relative 'fidelity_training'
require_relative 'user'
include Win32

class MainMenu

  attr_accessor :user, :option

  def initialize
    clear
    @user = User.new
    @option = 0

    show_menu
  end

  def clear
    system 'cls'
  end

  def scoreboard
    puts 'The user scores will be shown here'
    sleep 5
  end

  def show_menu
    while @option != 3
      clear
      puts "Hi, #{@user.name}! Choose from options 1-5 below: "
      puts ' 1. Tone training'
      puts ' 2. Lossy vs lossless training'
      puts ' 3. Tone test'
      puts ' 4. Lossy vs Lossless test'
      puts ' 5. Exit'
      @option = gets.to_i
      case @option
      when 1
        ToneTraining.new(@user)
      when 2
        FidelityTraining.new(@user)
      when 3
        ToneTest.new(@user)
      when 4
        FidelityTest.new(@user)
      when 5
        exit
      else
        puts "That's not a valid choice."
      end
    end
  end

end

MainMenu.new