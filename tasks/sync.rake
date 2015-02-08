namespace :sync do
  desc "Clear all existing Dragon.rb commands"
  task :clear do
    Command.where(ZVENDOR: 'Dragon.rb').destroy_all
  end

  desc "Generate the workflows defined in templates"
  task :create do
    templates = {}
    Dir.glob('templates/*.yml') do |file|
      templates.merge! YAML::load(File.open(file))
    end
    templates.each do |template|
      workflow_params = template[1]
      workflow_params['builds'].each do |build|
        application, version, builder_class = build[0], build[1], build[2]
        @builder = builder_class.constantize.new
        Workflow.create!({
          application: application, application_version: version,
          description: workflow_params['description'],
          verbal_command: template[0], command_type: @builder.command_type,
          action: @builder.action
        })
      end
    end
  end
end
