require 'rails_helper'

describe Message do
  describe '#create'do
  it "is valid with a message" do
    message = build(:message, image:"")
    message.valid?
    expect(message).to be_valid
  end
 end
end
