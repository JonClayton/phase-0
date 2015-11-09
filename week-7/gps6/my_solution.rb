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
# initialize VirusPredictor
report = VirusPredictor.new
report.all_states
report.a_state("Illinois")
#=======================================================================
# Reflection Section