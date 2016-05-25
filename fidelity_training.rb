SAMPLE_PATH = File.dirname(__FILE__) + "/Samples/"

class FidelityTraining
  
  def initialize(user)
    @samples = Dir[SAMPLE_PATH + "*.wav"]
    @samplenames = 
    @answernum = nil
    @user = user
    
    start_training
  end
  
  def play_sample(sample)
    path = sample
    Sound.play(path)
  end
  
  def start_training
    
    system "cls"
    option = nil
    
    until option == 0
      system "cls"
      puts "Choose a sample to play:"
      x = 1
      for sample in @samples
        puts "#{x}. #{sample.sub(SAMPLE_PATH, "").sub(".wav", "")}"
        x+=1
      end
  
      option = gets.chomp.to_i
      if option == 0 
        return
      elsif option > @samples.length
        puts "That's not a valid choice"
      elsif option <= @samples.length
        play_sample(@samples[option-1])
      end
  
    end
  end
  
end