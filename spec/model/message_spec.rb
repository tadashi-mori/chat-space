require 'rails_helper'

describe Message do
  describe '#create'do

  # メッセージがあれば保存できる場合
  it "is valid with a body" do
    message = build(:message, image:"")
    message.valid?
    expect(message).to be_valid
  end
  # 画像があれば保存できる場合
  it "is valid with a image" do
    message = build(:message, body:"")
    message.valid?
    expect(message).to be_valid
  end
  # メッセージと画像があれば保存できる
  it "is valid with a body and image" do
    message = build(:message)
    message.valid?
    expect(message).to be_valid
  end

  # メッセージも画像も無いと保存できない
  it "is valid without a body and image" do
    message = build(:message, body: "", image:"")
    message.valid?
    expect(message).to be_invalid
  end

  # group_idがないと保存できない
  it "is valid without a group_id" do
    message = build(:message, group_id: "")
    message.valid?
    expect(message).to be_invalid
  end

  # user_idがないと保存できない
  it "is vaild without a user_id" do
    message = build(:message, user_id: "")
    message.valid?
    expect(message).to be_invalid
  end
 end
end
