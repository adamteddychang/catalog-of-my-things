require_relative '../music_album'

describe MusicAlbum do
  context 'Initialize MusicAlbum' do
    music_album_1 = MusicAlbum.new(1000, 'Sirenler', 'Rock', '05.01.2022', true)
    it 'Should return Class MusicAlbum' do
      expect(music_album_1).to be_an_instance_of MusicAlbum
    end
    it 'Should Return False' do
      expect(music_album_1.can_archived?).to be true
    end
  end

  context 'Initialize MusicAlbum' do
    music_album_2 = MusicAlbum.new(1000, 'Redd', 'Rock', '01.01.2022', false)
    it 'Should return Class MusicAlbum' do
      expect(music_album_2).to be_an_instance_of MusicAlbum
    end
    it 'Should Return False' do
      expect(music_album_2.can_archived?).to be false
    end
  end
end