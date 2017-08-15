FactoryGirl.define do

  factory :message do
    body          "nekoneko"
    image         Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixtures/images.jpg'))
    group_id      "1"
    user_id       "1"
  end
end

