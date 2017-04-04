module RedmineSeed
  class Generator
    class << self
      def invoke
        plugin_dir = Redmine::Plugin.find(:redmine_seed).directory
        load "#{plugin_dir}/db/seed.rb"
      end
    end
  end
end
