# Dragon.rb
A ruby DSL for customizing Dragon Dictate on OSX

## Setup
Clone the repo and run `bundle`. Copy the example database config
`cp db/database.example.yml db/database.yml` and configure:

```yml
# db/database.yml

test:
  adapter: sqlite3
  database:  'db/test.sqlite'
production:
  adapter: sqlite3
  database:  '/Users/USERNAME/Library/Application Support/Dragon/Commands/USERNAME.ddictatecommands'
```

Run tests with `rspec spec`. Sync to Dragon with `rake`.

## WARNING
This is currently an experimental project under active development.
Collaborators are welcome, but please do not consider the library ready for use.
If used incorrectly, this has the potential to permanently corrupt your Dragon
Dictate command library (and any related data).
