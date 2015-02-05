namespace :sync do
  desc "Clear all existing Dragon.rb commands"
  task :clear do
    Command.where(ZVENDOR: 'Dragon.rb').destroy_all
  end

  desc "Generate the workflows defined in templates"
  task :create do
    templates = YAML::load(File.open('templates/navigation.yml'))
    templates.each do |template|
      workflow_params = template[1]
      workflow_params['applications'].each do |application|
        @builder = workflow_params['builder'].constantize.new
        Workflow.create!({
          application: application[0], application_version: application[1],
          description: workflow_params['description'],
          verbal_command: template[0], command_type: @builder.command_type,
          action: @builder.action
        })
      end
    end
  end
end
