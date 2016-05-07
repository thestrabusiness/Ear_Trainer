ALL_TONES = ["32Hz", "64Hz", "125Hz", "250Hz", "500Hz", "1kHz", "2kHz", "4kHz", "8kHz", "16kHz"]
TONE_PATH = File.dirname(__FILE__) + "/Tones/"

class ToneTest

attr_accessor :test_tones, :responses

def initialize
  @test_tones = ALL_TONES.shuffle
  @responses = []
  
  run_test(@test_tones, @responses)
end

def play_tone(tone)
  path = TONE_PATH + "#{tone}.wav"
  Sound.play(path)
end

def run_test(test_tones, responses)
  @test_tones.each do |answer|
    @responses << answer
    pick = 1
    while pick < 4
      raw_responses = (@test_tones -  responses)
      @responses << raw_responses.sample
      raw_responses = (raw_responses - responses)
      pick += 1
    end      

    @responses.shuffle!
    x = 1
    answernum = nil
    @responses.each do |response|
      answernum = x if response == answer 
      print x
      x += 1
      puts". #{response}"
    end
    play_tone(answer)
    puts "Which tone played?"
    answer = gets.chomp.to_i
    answer == answernum ? (puts "Correct!"):(puts "Incorrect!")
  end
end
  
end