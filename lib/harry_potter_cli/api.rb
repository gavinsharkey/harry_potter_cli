class HarryPotterCLI::API
  attr_accessor :json_characters
  
  URL = 'https://www.potterapi.com/v1'
  KEY = '$2a$10$y4aEwbtJkfA4aMfvwmpPQOoNJGSNatKQ5ZHvreJR0XIE0KZGpraZO'

  def get(route)
    response = RestClient.get(URL + route, {params: {key: KEY}})
    JSON.parse(response, symbolize_names: true)
  end
  
  def initialize
    @json_characters = self.get('/characters')
  end
  
  def make
    self.make_characters
    self.make_schools
    self.make_houses
    self
  end

  def make_characters
    self.json_characters.each do |character|
      HarryPotterCLI::Character.new(character)
    end
  end

  def make_schools
    school_names = self.json_characters.map do |hash|
      hash[:school]
    end.uniq.compact

    school_names.each do |school_name|
      HarryPotterCLI::School.new(school_name)
    end
  end

  def make_houses
    house_names = self.json_characters.map do |hash|
      hash[:house]
    end.uniq.compact

    house_names.each do |house_name|
      HarryPotterCLI::House.new(house_name)
    end
  end

end