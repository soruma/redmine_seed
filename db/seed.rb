require 'factory_girl_rails'
include FactoryGirl::Syntax::Methods

plugin_dir = Redmine::Plugin.find(:redmine_seed).directory
Dir["#{plugin_dir}/db/factories/**/*.rb"].each { |f| require f }

setting_notified_events = Setting.notified_events
Setting.notified_events = []

console = Logger.new(STDOUT)

console.info 'Delete exist data'
Project.delete_all
User.where("login != 'admin'").delete_all
Member.delete_all
Version.delete_all
Issue.delete_all

console.info 'Create projects'
create_list :dev_project, 10

console.info 'Create project members'
admin = User.find_by_login :admin
users = create_list :dev_user, 5
Project.all.each do |project|
  create :dev_member, project: project, roles: [Role.givable.first], user_id: admin.id
  users.each do |user|
    create :dev_member, project: project, user: user
  end
end

console.info 'Create versions'
create_list :dev_version, 20

console.info 'Create issues'
create_list :dev_issue, 500

Setting.notified_events = setting_notified_events
