require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:friend) }
  it { should allow_value(true).for(:confirmed) }
  it { should allow_value(false).for(:confirmed) }
end
