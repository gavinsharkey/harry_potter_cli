class HarryPotterCLI::CLI

  def call
    HarryPotterCLI::API.new.make

    puts "\n_____Harry Potter Character Wiki_____"

    self.main_loop

    puts "\nThanks for visiting!"
  end

  def main_loop
    while true
      self.list_options
      print "\nWhat would you like to do? "
      input = gets.strip.to_i
      if input.between?(1, 6)
        input == 6 ? break : self.options(input)
      else
        puts "\n__Invalid Input__"
        next
      end

      print "\nWould you like to view something else?(Y/N) "
      repeat = gets.strip.downcase
      break if repeat == 'n'
    end
  end

  def list_options
    puts ''
    puts "1. Find Character By Name"
    puts "2: Find Characters By Name"
    puts "3. List All Characters"
    puts "4. List Characters By School"
    puts '5. List Characters By House'
    puts '6. Exit'
  end

  def options(input)
    case input
    when 1
      self.find_character
    when 2
      self.find_characters
    when 3
      self.list_characters
    when 4
      self.list_characters_by_school
    when 5
      self.list_characters_by_house
    end
  end

  def character_details(character)
    # Prints formatted character details of passed in character
    puts ""
    puts "---------------------------"
    puts "Name: #{character.name}"
    puts "  Alias: #{character.alias}" if character.alias
    puts "  School: #{character.school.name}" if character.school.class == HarryPotterCLI::School
    puts "  House: #{character.house.name}" if character.house.class == HarryPotterCLI::House
    puts "  Patronus: #{character.patronus}" if character.patronus
    puts "  Species: #{character.species}"
    puts "  Affiliations:"
    puts "    Dumbledore's Army" if character.dumbledoresArmy
    puts "    Death Eater" if character.deathEater
    puts "    Order of the Phoenix" if character.orderOfThePhoenix
    puts "    Ministry of Magic" if character.ministryOfMagic
    puts "---------------------------"
  end

  def find_character
    print "\nName of character (case_insensitive): "
    name = gets.strip
    regexp = HarryPotterCLI::Character.name_to_regexp(name)
    character = HarryPotterCLI::Character.find_by_regexp(regexp)
    # character = HarryPotterCLI::Character.find_by_name(name)
    if character 
      self.character_details(character)
      print "\nWould you like to find another character?(Y/N) "
    else
      print "\nCould not find a character by that name. Would you like to try again?(Y/N) "
    end
    repeat = gets.strip.downcase
    self.find_character if repeat == 'y'
  end

  def find_characters
    print "\nFind all characters with (case_insensitive): "
    name = gets.strip
    regexp = HarryPotterCLI::Character.name_to_regexp(name)
    characters = HarryPotterCLI::Character.find_by_regexp(regexp)
    if !characters.empty?
      self.print_characters(characters)
      self.select_character(characters)
      print "\nWould you like to find more characters?(Y/N): "
    else
      print "\nI couldn't find any characters like that. Would you like to try again?(Y/N):"
    end
    repeat = gets.strip.downcase
    self.find_characters if repeat == 'y'
  end

  def list_characters
    self.print_characters(HarryPotterCLI::Character.all)
    self.select_character(HarryPotterCLI::Character.all)
  end

  def list_characters_by_school
    puts ""
    HarryPotterCLI::School.all.each.with_index(1) do |school, i|
      puts "#{i}. #{school.name}"
    end
    self.select_group(HarryPotterCLI::School.all, 'school')
  end

  def list_characters_by_house
    puts ""
    HarryPotterCLI::House.all.each.with_index(1) do |house, i|
      puts "#{i}. #{house.name}"
    end
    self.select_group(HarryPotterCLI::House.all, 'house')
  end
  
  def print_characters(characters)
    # Iterates over list of passed characters, prints them in list format
    puts ''
    characters.each.with_index(1) do |char, i|
      puts "#{i}. #{char.name}"
    end
  end

  def select_character(characters)
    # Logic for selecting character from list, checks if input valid
    # Sends selected character to #character_details
    while true
      print "\nWhich character would you like to view? "
      input = gets.strip.to_i

      if input.between?(1, characters.length)
        self.character_details(characters[input - 1])
        break
      else
        puts "\n__Invalid Input__"
      end
    end
  end

  def select_group(group, type)
    # Logic for selecting school/house from list, checks if input valid
    # Sends array of students from selected school/house to #print_characters and #select_characters
    while true
      print "\nWhich #{type} would you like to view? "
      input = gets.strip.to_i

      if input.between?(1, group.length)
        self.print_characters(group[input - 1].students)
        self.select_character(group[input - 1].students)
        break
      else
        puts "\n__Invalid Input__"
      end
    end
  end

end