namespace :sync do
  desc "Clear all existing Dragon.rb commands"
  task clear: :environment do
    Command.where(ZVENDOR: 'Dragon.rb').destroy_all
  end

  desc "Generate the workflows in the template"
  task create: :environment do
  end
end
