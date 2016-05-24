ALL_TONES = ["32Hz", "64Hz", "125Hz", "250Hz", "500Hz", "1kHz", "2kHz", "4kHz", "8kHz", "16kHz"]
TONE_PATH = File.dirname(__FILE__) + "/Tones/"

class ToneTraining
  
  def initialize(user)
    system "cls"
    @user = user
    @tones = ALL_TONES
    
    start_training
  end
  
  def play_tone(tone)
    path = TONE_PATH + "#{tone}.wav"
    Sound.play(path)
  end
  
  def start_training
    
    system "cls"
    option = nil
    
    until option == 0
      system "cls"
      puts "Choose a tone to play:"
      x = 1
      for tone in @tones
        puts "#{x}. #{tone}"
        x+=1
      end
      
      option = gets.chomp.to_i
      if option > @tones.length
          puts "That's not a valid choice"
      elsif option <= @tones.length
          play_tone(@tones[option])
      end
  
    end
  end

end