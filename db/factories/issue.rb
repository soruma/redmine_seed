FactoryBot.define do
  factory :dev_issue, class: Issue do
    subject { 'issue' }
    project_id { Project.pluck(:id).sample }
    tracker_id { Tracker.pluck(:id).sample }
    status_id { IssueStatus.pluck(:id).sample }
    priority_id { IssuePriority.pluck(:id).sample }
    category_id { IssueCategory.pluck(:id).sample }

    fixed_version { assignable_versions.sample }
    author_id { User.pluck(:id).sample }
    assigned_to_id { project.members.map(&:user_id).push(nil).sample }
    due_date { Random.rand(1.year.ago...1.year.since) }
    estimated_hours { Random.rand(0...10) }

    notify { false } if Redmine::VERSION::MAJOR > 2
  end
end
