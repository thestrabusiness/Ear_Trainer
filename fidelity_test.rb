class FidelityTest
  attr_reader :placeholder
  
  def initialize
    @placeholder = "Fidelity test goes here"
    
    run_test(@placeholder)
  end
  
  def run_test(placeholder)
    puts placeholder
  end
  
end