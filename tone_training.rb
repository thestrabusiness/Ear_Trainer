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
      puts "Choose a tone to play, or enter 0 to return..."
      x = 1
      for tone in @tones
        puts "#{x}. #{tone}"
        x+=1
      end
      
      option = gets.chomp.to_i
      if option == 0 
        return
      elsif option > @tones.length
          puts "That's not a valid choice"
      elsif option <= @tones.length
          play_tone(@tones[option-1])
      end
  
    end
  end

end