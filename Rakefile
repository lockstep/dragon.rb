ENV['DRAGON_ENV'] ||= 'production'
require File.expand_path("../config/environment", __FILE__)
rake_tasks = File.join(File.dirname(__FILE__), 'tasks', '**', '*.rake')
Dir[rake_tasks].each { |file| load file }

task default: ['sync:clear', 'sync:create']
