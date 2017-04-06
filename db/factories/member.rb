FactoryGirl.define do
  factory :dev_member, class: Member do
    project_id { Project.pluck(:id).sample }
    user_id do
      members = project.members.map(&:user_id)
      users = User.where(type: 'User').pluck(:id)
      (users - members).sample
    end
    roles { [Role.find(Role.givable.pluck(:id).sample)] }

    mail_notification true
  end
end
