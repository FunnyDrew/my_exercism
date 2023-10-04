=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end
class SpaceAge
  attr_accessor :age
  @@planets_orb_period_to_earth = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }
  EARTH_ORB_PERIOD_IN_SEC = 31557600

  def initialize(seconds)
    @age = seconds
  end

  @@planets_orb_period_to_earth.each do |planet_name, period|
    define_method("on_#{planet_name}") {@age/period/EARTH_ORB_PERIOD_IN_SEC}
  end
  
end
