require_dependency 'redmine_seed/generator'

Redmine::Plugin.register :redmine_seed do
  name 'Redmine seed plugin'
  author 'routetheta'
  description 'This is a plugin to generate dummy data for development.'
  version '0.0.1'
end
