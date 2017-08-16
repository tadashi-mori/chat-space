FactoryGirl.define do

  factory :message do
    body          "nekoneko"
    image         {Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images.jpg'))}
    created_at    {Faker::Time.between(2.days.ago, Date.today, :all)}
    updated_at    {Faker::Time.between(2.days.ago, Date.today, :all)}

    association :user, factory: :user
    association :group, factory: :group

  end
end

