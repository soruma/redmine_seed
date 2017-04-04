namespace :redmine do
  namespace :plugins do
    namespace :redmine_seed do
      desc 'Generate dummy data'
      task generate: :environment do
        Rake::Task['redmine:load_default_data'].invoke
        RedmineSeed::Generator.invoke
      end
    end
  end
end
