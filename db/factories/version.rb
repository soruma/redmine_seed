FactoryGirl.define do
  factory :dev_version, class: Version do
    project { Project.find Project.pluck(:id).sample }
    sequence(:name) { |i| "version_#{i}" }
    status { Version::VERSION_STATUSES.sample }
    sharing { Version::VERSION_SHARINGS.sample }
    effective_date { Random.rand(1.year.ago...1.year.since) }
  end
end
