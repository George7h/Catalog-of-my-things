# music_album_spec.rb
require './classes/musicalbum'

RSpec.describe MusicAlbum do
  describe '#initialize' do
    it 'creates a MusicAlbum with the correct attributes' do
      publish_date = Time.now
      on_spotify = true

      music_album = MusicAlbum.new(publish_date, on_spotify)

      expect(music_album.publish_date).to eq(publish_date)
      expect(music_album.on_spotify).to eq(on_spotify)
    end
  end

  describe '#on_spotify?' do
    it 'returns true if the music album is on Spotify' do
      music_album = MusicAlbum.new(Time.now, true)
      expect(music_album.on_spotify?).to be(true)
    end

    it 'returns false if the music album is not on Spotify' do
      music_album = MusicAlbum.new(Time.now, false)
      expect(music_album.on_spotify?).to be(false)
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the music album can be archived' do
      music_album = MusicAlbum.new(Time.now, true)
      expect(music_album.can_be_archived?).to be(true)
    end

    it 'returns false if the music album cannot be archived' do
      music_album = MusicAlbum.new(Time.now, false)
      expect(music_album.can_be_archived?).to be(false)
    end
  end
end
