require 'active_record'
require 'yaml'

dbconfig = YAML::load(File.open('db/database.yml'))
which_config = ENV['DRAGON_ENV'] || 'test'
ActiveRecord::Base.establish_connection(dbconfig[which_config])

Dir[File.join(File.dirname(__FILE__), '..', 'models', '*.rb')].each do |file|
  require file
end
Dir[File.join(File.dirname(__FILE__), '..', 'lib', '**', '*.rb')].each do |file|
  require file
end
