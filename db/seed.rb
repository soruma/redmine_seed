require 'factory_girl_rails'
include FactoryGirl::Syntax::Methods

plugin_dir = Redmine::Plugin.find(:redmine_seed).directory
Dir["#{plugin_dir}/db/factories/**/*.rb"].each { |f| require f }

console = Logger.new(STDOUT)

console.info 'Delete exist data'
Project.delete_all
Member.delete_all
Version.delete_all
Issue.delete_all

console.info 'Create projects'
create_list :dev_project, 10

console.info 'Create project members'
Project.all.each do |project|
  create :dev_member, project: project
end

console.info 'Create versions'
create_list :dev_version, 20

console.info 'Create issues'
create_list :dev_issue, 200
