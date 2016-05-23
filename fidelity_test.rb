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
  
  def question_end(answer)
    puts answer == @answernum ? @user.keep_score : "Incorrect!"
  end

  def run_test
    system "cls"
    x = 1
    letters = ["A", "B"]
    set = []
    
    
    while x <= @samples.length/2 do
      responded = false
      sample_count = 1
      rand(2..5).times { letters.shuffle! }
      letters.each do |letter|
        filename = "Sample#{x}_#{letter}.wav"
        set << filename
        puts "Playing sample #{sample_count} of 2 from set #{x}..."
        @answernum = sample_count if letter == "B"
        
        play_sample(filename)
        
        sample_count += 1
      end
      
      while responded == false
        puts "Which sample was lossless?"
        puts 'Answer "1" or "2", or enter "3" to replay'
        answer = gets.to_i
        case answer
          when 1            
            question_end(answer)
            responded = true
          when 2            
            question_end(answer)
            responded = true
          when  3
            set.each { |sample| play_sample(sample) }
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