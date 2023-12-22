# spec/musicalbum_spec.rb
require './classes/musicalbum'

describe MusicAlbum do
  it 'returns true if parent method is true' do
    music = MusicAlbum.new('genre1', 'author1', 'source1', 'label', Time.now, true)
    expect(music.send(:can_be_archived?)).to be_truthy
  end
end
