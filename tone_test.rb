ALL_TONES = ["32Hz", "64Hz", "125Hz", "250Hz", "500Hz", "1kHz", "2kHz", "4kHz", "8kHz", "16kHz"]
TONE_PATH = File.dirname(__FILE__) + "/Tones/"

class ToneTest

  attr_accessor :test_tones, :responses, :raw_responses, :answernum

  def initialize(user)
    @test_tones = ALL_TONES.shuffle
    @answernum = nil
    @user = user
    
    run_test(@test_tones)
  end

  def play_tone(tone)
    path = TONE_PATH + "#{tone}.wav"
    Sound.play(path)
  end
  
  def keep_score
    @user.score += 1
    puts "Correct!"
  end

  def generate_question
    pick = 1
    while pick <4
      @raw_responses = (@test_tones -  @responses)
      @responses << raw_responses.sample
      @raw_responses = (raw_responses - @responses)
      pick += 1
    end
  end
  
  def print_question(answer)
    @responses.shuffle!
    x = 1
    @responses.each do |response|
      @answernum = x if response == answer 
      print x
      puts". #{response}"
      x += 1
    end
  end

  def run_test(test_tones)
    @test_tones.each do |answer|
      system "cls"
      @responses = []
      @responses << answer
      
      generate_question
      
      print_question(answer)
      
      play_tone(answer)
      puts "Which tone played?"
      answer = gets.to_i
      puts answer == @answernum ? keep_score : "Incorrect!"
      sleep 2
    end
    puts "You got #{@user.score} out of 10 correct!"
    sleep 3    
  end
  
end