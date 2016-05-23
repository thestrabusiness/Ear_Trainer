SAMPLE_PATH = File.dirname(__FILE__) + "/Samples/"

class FidelityTest
  
  def initialize(user)
    @samples = Dir[SAMPLE_PATH + "*.wav"]
    @answernum = nil
    @answer = ""
    @user = user
    @user.score = 0
    
    run_test
  end
    
  def play_sample(sample)
    path = SAMPLE_PATH + sample
    Sound.play(path)
  end
  
  def generate_question
  end

  def run_test
    system "cls"
    x = 1
    letters = ["A", "B"]
    set = []
    
    while x <= @samples.length/2 do
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
      
      
      until @answer == @answernum.to_s
        puts "Which sample was lossless?"
        puts 'Answer "1" or "2", or leave blank and hit "Enter" to replay'
        @answer = gets.chomp.to_s
        if @answer == ""
          set.each { |sample| play_sample(sample) }
        elsif @answer == "1" || "2"            
          puts @answer.to_i == @answernum ? @user.keep_score : "Incorrect!"
        else
          puts "whoops"
        end
      end

      sleep 2
      x += 1
    end
    
    puts "You got #{@user.score} out of #{@samples.length/2} correct!"
    sleep 3
  end

end