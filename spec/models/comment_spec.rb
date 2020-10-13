require 'rails_helper'

RSpec.describe Comment, type: :model do
    before {@comment = FactoryBot.build(:comment)}

    it 'Validates presence of content' do
        expect(Comment.new).to validate_presence_of(:content)
    end
    it 'is not valid if is more then 200 ' do
        expect(Comment.new(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin maximus a augue ac rhoncus. Etiam nec enim ipsum. Curabitur dictum ut augue vitae dictum. Vivamus tristique efficitur est sed pharetra. Fusce velit eros, venenatis sit amet consectetur nec, placerat eget massa. Sed sem magna, ultrices malesuada efficitur vitae, efficitur a mauris. Sed at consequat tellus. Quisque molestie eget dolor in semper. Vestibulum non diam et lectus lobortis bibendum. Mauris sit amet odio ac dui commodo efficitur at a lacus.

            Aliquam erat volutpat. Curabitur nec risus diam. Integer pretium leo ac volutpat finibus. Integer venenatis risus quis dolor tincidunt, vel sagittis tellus ornare. Nullam dui nunc, facilisis vitae nisi in, interdum pellentesque mauris. Duis a nisl sem. Pellentesque maximus velit lorem, non rhoncus sem fringilla id. Integer eu enim sem. Nulla luctus sapien ac sollicitudin tempus. Quisque ultricies, diam at malesuada auctor, nibh mi semper dui, ac auctor nibh arcu vel odio.
            Nam faucibus turpis eu egestas suscipit. Etiam ut blandit dolor. Donec in dolor id dolor vehicula laoreet id et eros. Donec pharetra auctor neque fermentum eleifend. Donec at velit ipsum. Duis leo erat, commodo id volutpat eu, hendrerit non tellus. Nunc auctor nunc sed hendrerit vehicula. Pellentesque vitae lectus et magna viverra vestibulum ut et purus. Aliquam quis enim arcu. Pellentesque venenatis ipsum vel nulla blandit, nec molestie turpis condimentum. Integer vitae mi massa. In hac habitasse platea dictumst. Phasellus sit amet elit id dolor euismod rutrum. Cras id sem in est sollicitudin sagittis eu sed ante. Nam et lorem eros. Nunc rutrum dolor semper, rhoncus tellus in, tristique purus.
            Duis hendrerit cursus purus ac faucibus. Suspendisse potenti. Aliquam sem dui, viverra nec massa at, pulvinar facilisis quam. Integer ac cursus quam. Nulla facilisi. Donec vel finibus quam. Sed volutpat nunc eu felis ultrices vestibulum. 
            Sed efficitur ipsum ut')).to_not be_valid
      end

    it { should belong_to(:user) }
    it { should belong_to(:post) }

end