class HarryPotterCLI::Character
  extend Findable

  attr_accessor :name, :house, :school, :patronus, :species, :bloodStatus, :deathEater, :dumbledoresArmy
  attr_accessor :orderOfThePhoenix, :ministryOfMagic, :alias, :wand, :boggart, :animagus

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(attributes)
    attributes.each do |key, value|
      self.send("#{key}=", value) if self.methods.include?("#{key}=".to_sym)
    end

    self.save
  end

  def school
    school = HarryPotterCLI::School.find_by_name(@school)
    school ? school : @school
  end

  def house
    house = HarryPotterCLI::House.find_by_name(@house)
    house ? house : @house
  end

  def self.find_by_name(name) # overrides Findable
    self.all.detect {|obj| obj.name.downcase == name.downcase}
  end

  def self.name_to_regexp(name)
  name = ".*#{name.strip.gsub(' ', '.*')}.*"
    Regexp.new(name)
  end

  def self.find_by_regexp(regexp)
    self.all.select {|char| char.name.downcase.match?(regexp)}
  end
end