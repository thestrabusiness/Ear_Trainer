SAMPLE_PATH = File.dirname(__FILE__) + "/Samples/"

class FidelityTest
  
  def initialize(user)
    @samples = Dir[SAMPLE_PATH + "*.wav"]
    @answernum = nil
    @user = user
    @user.score = 0
    
    run_test
  end
    
  def play_sample(sample)
    path = SAMPLE_PATH + sample
    Sound.play(path)
  end
  
  def end_question(answer)
    puts answer == @answernum ? @user.keep_score : "Incorrect!"
    return true
  end

  def run_test
    system "cls"
    x = 1
    types = ["MP3", "FLAC"]
    clips =   []
    
    
    while x <= @samples.length/2 do
      responded = false
      sample_count = 1
      
      rand(2..5).times { types.shuffle! }
      types.each do |type|
        filename = "Sample#{x}_#{type}.wav"
        clips << filename
        
        puts "Playing sample #{sample_count} of 2 from set #{x}..."
        @answernum = sample_count if type == "FLAC"
        
        play_sample(filename)
        
        sample_count += 1
      end
      
      while responded == false
        puts "Which sample was lossless?"
        puts 'Answer "1" or "2", or enter "3" to replay'
        answer = gets.to_i
        
        case answer
          when 1, 2            
            responded = end_question(answer)
          when 3
            clips.each { |sample| play_sample(sample) }
          else
            puts "That's not a valid choice"
        end
        
      end

      sleep 2
      x += 1
    end
    
    puts "You got #{@user.score} out of #{@samples.length/2} correct!"
    sleep 3
  end

end