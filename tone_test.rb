ALL_TONES = ["32Hz", "64Hz", "125Hz", "250Hz", "500Hz", "1kHz", "2kHz", "4kHz", "8kHz", "16kHz"]
TONE_PATH = File.dirname(__FILE__) + "/Tones/"

def play_tone(tone)
  path = TONE_PATH + "#{tone}.wav"
  Sound.play(path)
end

def tone_test
  test_tones = ALL_TONES.shuffle  
  test_tones.each do |answer|
    responses = []
    responses << answer
    
    pick = 1
    while pick < 4
      raw_responses = (test_tones -  responses)
      responses << raw_responses.sample
      raw_responses = (raw_responses - responses)
      pick += 1
    end      
    
    responses.shuffle!
    x = 1
    answernum = nil
    responses.each do |response|
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