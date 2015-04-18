require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is invalid without a title" do
    @post1 = build(:post, title: nil)
    expect(@post1).not_to be_valid
  end

  it "requires text of over 20 characters" do
    @post2 = build(:post, text: "yeah")
    expect(@post2).not_to be_valid
  end
end
