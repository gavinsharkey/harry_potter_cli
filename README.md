# Harry Potter CLI

Hello! This is a CLI for querying and viewing characters from the Harry Potter series.  
This CLI gets all of its information for the PotterAPI, which you can find at www.potterapi.com.

## Installation

After you fork this repo, run ```ruby bin/console``` from this directory

## Usage

Upon startup, you'll be greeted by a UI like this:  
```
_____Harry Potter Character Wiki_____

1. Find Character By Name
2: Search All Characters
3. List All Characters
4. List Characters By School
5. List Characters By House
6. Exit

What would you like to do? 
```

The UI is pretty self-explanatory, but put briefly:  

### Find Character By Name  
    This will ask for the (specific) name of a character, and return their details.  
    ```
    Name of character (case_insensitive): harry potter

    ---------------------------
    Name: Harry Potter
    Alias: The Boy Who Lived
    School: Hogwarts School of Witchcraft and Wizardry
    House: Gryffindor
    Patronus: stag
    Species: human
    Affiliations:
        Dumbledore's Army
        Order of the Phoenix
    ---------------------------
    ```

### Search All Characters
    This one will accept a name and returns a list of characters containing that name.  
    Like, for instance, if you search "weasley", it will return:  
    ```
    Find all characters with (case_insensitive): weasley

    1. Arthur Weasley
    2. William Weasley
    3. Charles Weasley
    4. Fred Weasley
    5. George Weasley
    6. Ginevra Weasley
    7. Molly Weasley
    8. Percy Weasley
    9. Ronald Weasley
    ```
    You can then pick a character from this list to view the details of.  

### List All Characters
    ...this lists all the characters.

### List Characters By School/House
    These two are pretty similar. Each lists all schools/houses respectively,  
    and you can choose a school/house to view the students of.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/gavinsharkey/harry_potter_cli.git.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
