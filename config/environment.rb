require 'active_record'
require 'yaml'

dbconfig = YAML::load(File.open('db/database.yml'))
ActiveRecord::Base.establish_connection(dbconfig['test'])

Dir[File.join(File.dirname(__FILE__), '..', 'models', '*.rb')].each do |file|
  require file
end
