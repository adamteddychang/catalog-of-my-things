require_relative '../music_album'

describe MusicAlbum do
  context 'Initialize MusicAlbum Bigger Release Date True Spotify' do
    music_album1 = MusicAlbum.new(1000, 'Sirenler', 'Rock', '2005-11-11', true)
    it 'Should return Class MusicAlbum' do
      expect(music_album1).to be_an_instance_of MusicAlbum
    end
    it 'Should Return True' do
      expect(music_album1.can_archived?).to be true
    end
  end

  context 'Initialize MusicAlbum Bigger Release Date False Spotify' do
    music_album2 = MusicAlbum.new(1000, 'Redd', 'Rock', '2005-11-11', false)
    it 'Should return Class MusicAlbum' do
      expect(music_album2).to be_an_instance_of MusicAlbum
    end
    it 'Should Return False' do
      expect(music_album2.can_archived?).to be false
    end
  end

  context 'Initialize MusicAlbum Smaller Release Date True Spotify' do
    music_album3 = MusicAlbum.new(1000, 'Redd', 'Rock', '2020-11-11', true)
    it 'Should return Class MusicAlbum' do
      expect(music_album3).to be_an_instance_of MusicAlbum
    end
    it 'Should Return False' do
      expect(music_album3.can_archived?).to be false
    end
  end

  context 'Initialize MusicAlbum Smaller Release Date False Spotify' do
    music_album4 = MusicAlbum.new(1000, 'Redd', 'Rock', '2020-11-11', false)
    it 'Should return Class MusicAlbum' do
      expect(music_album4).to be_an_instance_of MusicAlbum
    end
    it 'Should Return False' do
      expect(music_album4.can_archived?).to be false
    end
  end
end
