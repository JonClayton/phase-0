# EXPLANATION OF require_relative
# links to a file in the relative (same) location. Derivation of "require" which may be used to access direct links.

require_relative 'state_data'

class VirusPredictor

  # Loads the class with information
  def initialize
  end

  # Predicts the effects of the virus spread by calling two other class methods.
  def virus_effects
    predicted_deaths 
    speed_of_spread 
  end
  
  def all_states
    STATE_DATA.each_key {|state| a_state(state)}
  end
  
  def a_state(state)
    @state = state
    @population = STATE_DATA[state][:population]
    @population_density = STATE_DATA[state][:population_density]      
    virus_effects
  end
  
  private

  # Predicts number of deaths based on a state's population and population density.
  def predicted_deaths 
    # predicted deaths is solely based on population density
    case @population_density
      when (0...50)
      @death_factor = 0.05
      when (50...100)
      @death_factor = 0.1
      when (100...150)
      @death_factor = 0.2      
      when (150...200)
      @death_factor = 0.3
    else
      @death_factor = 0.4
    end
    number_of_deaths = (@population * @death_factor).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # Predicts the speed of virus spread within a state.
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.5 + 0.5 * [(250-@population_density.to_i)/50,0].max
    puts " and the virus will spread across the state in #{speed} months.\n\n"
  end
  
end
#=======================================================================
# DRIVER CODE
report = VirusPredictor.new
report.all_states
report.a_state("Illinois")

=begin

## Reflection Section
###What are the differences between the two different hash syntaxes shown in the state_data file?
The states name keys are in string form and require the old fashioned hash syntax.  The enclosed hashes have symbols as keys and can use the simplified (symblified?!) syntax for adding values.

###What does require_relative do? How is it different from require?
It brings in code from another file.  The relative tells it to look in the same directory as the current file's location.

###What are some ways to iterate through a hash?
`#each` is the easiest, with its variants like `each_with_key`. Other methods like `map` and `inject` also may work since Hash includes the Enumerable module but they may behave in unexpected ways. For example, `Hash#map` returns an array. 

###When refactoring virus_effects, what stood out to you about the variables, if anything?
They were instance variables and already accessible within the called instance methods, so no need for arguments.

###What concept did you most solidify in this challenge?
DRY. Any time you see lines that are essentially identical, look for ways to combine them.

=end
