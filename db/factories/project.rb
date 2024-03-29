FactoryBot.define do
  factory :dev_project, class: Project do
    name { identifier }
    identifier { Project.next_identifier || 'project_1' }
    trackers { Tracker.all }

    is_public { [true, false].sample }
  end
end
