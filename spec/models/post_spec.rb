require 'rails_helper'

RSpec.describe Post, type: :model do
  before { @post = FactoryBot.build(:post) }

  it 'Validates presence of content' do
    expect(Post.new).to validate_presence_of(:content)
  end

  it { should belong_to(:user) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }
end
