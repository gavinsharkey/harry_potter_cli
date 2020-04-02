class HarryPotterCLI::House
  extend Findable

  attr_accessor :name

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def initialize(name)
    self.name = name
    self.save
  end

  def students
    HarryPotterCLI::Character.all.select {|char| char.house == self}
  end

  def student_names
    self.students.map {|student| student.name}
  end
end